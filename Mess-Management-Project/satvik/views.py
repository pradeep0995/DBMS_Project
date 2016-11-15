from django.shortcuts import render
from django.db import connection
from django.http import HttpResponse
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as logout_view
from django.contrib.auth.models import User
import datetime
from django.shortcuts import redirect

def index(request):
	with connection.cursor() as cursor:
			cursor.execute("select notice from NOTICE where notice_no >= all(select notice_no from NOTICE)")
			notice = cursor.fetchall()
			context = {
			'notice' : notice
			}
			return HttpResponse(render(request,'satvik/home.html',context))

def menu(request):
	return render(request, 'satvik/menu.html')

def login(request):
	if request.method == 'POST':
		username = request.POST.get('username')
		password = request.POST.get('password')
		user = authenticate(username=username,password=password)
		if user is not None:
			if user.is_active:
				auth_login(request,user)
				#print (request.user.is_authenticated())
				return redirect('/login/facility')
			else:
				print("error")
		else:
			context = {
			'error' : 'Username/password is incorrect'}
			return HttpResponse(render(request,'satvik/loginform.html', context))

	elif request.method == 'GET':
		return render(request, 'satvik/loginform.html')

def logout(request):
	logout_view(request)
	return HttpResponse(render(request,'satvik/loginform.html'))

def enroll(request):
	if request.method == 'POST':

		# get all the attributes from the form
		rollno  =   request.POST.get('rollno')
		name    =   request.POST.get('name')
		sem     =   request.POST.get('semester')
		year    =   request.POST.get('year')
		phone   =   request.POST.get('phone')
		hostel  =   request.POST.get('hostel')
		receipt =  request.POST.get('receipt')
		account =  request.POST.get('account')
		mess    =   request.POST.get('mess')

		alpha = list(map(chr,range(97,123))) + list(map(chr,range(65,90)))
		alpha.append(' ')
		alphanum = list(map(chr, range(97, 123))) + list(map(chr, range(48, 58))) 
		alphanum += list(map(chr,range(65,90)))
		semes = ['I','II','III','IV','V','VI','VII','VIII','IX','X']

		invalid = False
		# check for incorrect roll no
		if rollno.isdigit() == False:
			invalid = True
		if invalid:
			context = {
			'error' : 'RollNo should  contain only numbers'}
			return HttpResponse(render(request,'satvik/enrollmentform.html',context))

		#-------------------------------------------------------------------------
		# check for incorrect name
		for c in name:
			if c not in alpha:
				invalid = True;
		if invalid:
			context = {
			'error' : 'Name should contain only alphabets'}
			return HttpResponse(render(request,'satvik/enrollmentform.html',context))

		#-------------------------------------------------------------------------
		# check for incorrect year
		now = datetime.datetime.now()
		if int(year) != now.year:
			invalid = True
		if invalid:
			context = {
			'error' : 'Invalid Year'}
			return HttpResponse(render(request,'satvik/enrollmentform.html',context))

		#-------------------------------------------------------------------------
		# check for incorrect mess
		if int(mess) !=1 and int(mess) != 2:
			invalid = True
		if invalid:
			context = {
			'error' : 'Mess is either 1 or 2'}
			return HttpResponse(render(request,'satvik/enrollmentform.html',context))

		# check for incorrect SEMESTER
		if sem not in semes:
			invalid = True
		if invalid:
			context = {
				'error' : 'Enter Semester in Roman Numerals in Upper Case'
			}

			return HttpResponse(render(request,'satvik/enrollmentform.html',context))
		
		with connection.cursor() as cursor:
			#print("Connection made")
			cursor.execute('insert into ENROLLMENT(roll_no,name,semester,year,phone_no,hostel,receipt_no,account_no,mess_no) values(%s,%s,%s,%s,%s,%s,%s,%s,%s);', [rollno,name,sem,year,phone,hostel,receipt,account,mess])	
            
		return render(request,'satvik/signup.html')

	else:
		return render(request,'satvik/enrollmentform.html')

def signup(request):
	if request.method == 'POST':

		username = request.POST.get('userid')
		password = request.POST.get('password')
		print(username)
		print(password)
		user = User.objects.create_user(username,None,password)
		return HttpResponse(render(request,'satvik/loginform.html'))
	else:
		return HttpResponse(render(request,'satvik/signup.html'))

def facility(request):
	user=request.user.username
	context = {
	'user' : user
	}
	print (request.user.username)
	return HttpResponse(render(request,'satvik/facility.html', context))

def complaint(request):
	if request.method == 'GET':
		with connection.cursor() as cursor:
			cursor.execute("SELECT member_id, name, type FROM MESS_STAFF")
			staff = cursor.fetchall()
			context = {'staff' : staff}
		return HttpResponse(render(request,'satvik/complaint.html', context))
	elif request.method == 'POST':
		# get the values from the form
		enrollment = request.POST.get('enrollmentno')
		member = request.POST.get('memberid')
		date = request.POST.get('date')
		description = request.POST.get('description')
		# enter values into the database
		with connection.cursor() as cursor:
			cursor.execute("SELECT enrollment_id from ENROLLMENT where enrollment_id = %s ;",[enrollment])
			#-----------Error Handling -------------------------------------
			enroll = cursor.fetchone()
			if enroll is None:
				context = {
				'error' : 'Your enrollment did not match with registered users'
				}
				return HttpResponse(render(request,'satvik/complaint.html', context))
			cursor.execute("SELECT member_id from MESS_STAFF where member_id = %s;",[member])
			memberno = cursor.fetchone()
			if memberno is None:
				context = {
				'error' : 'The member id is invalid'
				}
				return HttpResponse(render(request,'satvik/complaint.html',context))
			#--------------Error Handling Done ------------------------------
			# No Error Found
			cursor.execute('insert into COMPLAINT values(%s,%s,%s,%s);',[enrollment,member,date,description])

		return HttpResponse("You have successfully registered your Complaint!")

def feedback(request):
	if request.method == 'GET':
		return HttpResponse(render(request,'satvik/feedback.html'))
	elif request.method == 'POST':
		rate = int(request.POST.get('rating'))
		suggestion = request.POST.get('suggestion')
		print (type(rate))
		print (rate)
		if rate > 10 or rate <= 0 :
			context = {
			'error' : 'The rating should be between 1 to 10'
			}
			return render(request,'satvik/feedback.html', context)
		with connection.cursor() as cursor:
			cursor.execute('insert into FEEDBACK(rating,suggestion) values (%s,%s);',[rate,suggestion])
		return HttpResponse("Your feedback has been successfully registered")

def  oldcomplaint(request):
	with connection.cursor() as cursor:
		print(request.user.username)
		cursor.execute("SELECT * from COMPLAINT")
		comp = cursor.fetchall()
		context = {'comp':comp}
	return HttpResponse(render(request,'satvik/oldcomplaint.html',context))

def oldfeedback(request):
	with connection.cursor() as cursor:
		print("connection made")
		cursor.execute("SELECT rating,suggestion from FEEDBACK")
		feeds = cursor.fetchall()
		context = {'feeds':feeds}
	return HttpResponse(render(request,'satvik/oldfeedback.html',context))
	


#--------------------------------------------------------------------------------------------------
#------------------------------------view related to Admin(superuser)------------------------------
def adminlogin(request):
	if request.method == 'GET':
		return render(request,'satvik/adminloginform.html')
	elif request.method == 'POST':
		username = request.POST.get('username')
		password = request.POST.get('password')
		#if username is superuser then only allow access
		user = authenticate(username=username,password=password)
		if user is None:
			context = {
			'error' : 'incorrect admin username/password'
			}
			return render(request,'satvik/adminloginform.html',context)
		if not user.is_superuser:
			return render(request,'satvik/adminloginform.html')
		return render(request,'satvik/adminpage.html')


def vstaff(request):
	with connection.cursor() as cursor:
		cursor.execute("SELECT * from MESS_STAFF")
		staf = cursor.fetchall()
		context = {'staf':staf}
	return HttpResponse(render(request,'satvik/staff.html',context))

def vstudent(request):
	with connection.cursor() as cursor:
		now = datetime.datetime.now()
		cursor.execute("SELECT roll_no,name,semester,hostel from ENROLLMENT where year = %s;",[now.year])
		stud = cursor.fetchall()
		context = {'stud':stud}
	return HttpResponse(render(request,'satvik/student.html',context))

def vinventory(request):
	with connection.cursor() as cursor:
		cursor.execute("SELECT item_name,mess_no,purchase_date,expenditure from ITEMS,PURCHASE_INVENTORY where item_no = item_id")
		inven = cursor.fetchall()
		context = {'inven':inven}
	return HttpResponse(render(request,'satvik/inventory.html',context))

def addstaff(request):
	if request.method == 'GET':
		return render(request,'satvik/addstaff.html')
	elif request.method == 'POST':
		name = request.POST.get('name')
		address = request.POST.get('add')
		phone = request.POST.get('phone')
		date = request.POST.get('date')
		Type = request.POST.get('Type')

		if phone.isdigit() == False or len(phone) != 10:
			context = {
			'error' : 'Entered phone is invalid'
			}
			return render(request,'satvik/addstaff.html',context)

		with connection.cursor() as cursor:
			cursor.execute('insert into MESS_STAFF(name,permanent_add,contact_no,date_of_join,type) values(%s,%s,%s,%s,%s);',[name,address,phone,date,Type])
		return render(request,'satvik/adminpage.html')

def removestaff(request):
	if request.method == 'GET':
		with connection.cursor() as cursor:
			cursor.execute("SELECT member_id ,name FROM MESS_STAFF")
			staff = cursor.fetchall()
			context = {'staff' : staff}
		return HttpResponse(render(request,'satvik/removestaff.html', context))
	elif request.method == 'POST':
		mid = request.POST.get('memberid')
		with connection.cursor() as cursor:
			cursor.execute("DELETE FROM MESS_STAFF WHERE member_id = %s;",[mid]);
		return HttpResponse(render(request,'satvik/adminpage.html'))

def addinventory(request):
	if request.method == 'GET':
		return render(request,'satvik/addinventory.html')
	elif request.method == 'POST':
		item = request.POST.get('item')
		mess = request.POST.get('mess')
		date = request.POST.get('date')
		qty = request.POST.get('quan')
		exp = request.POST.get('expen')

		with connection.cursor() as cursor:
			cursor.execute('insert into PURCHASE_INVENTORY values (%s,%s,%s,%s,%s);',[item,mess,date,qty,exp])
		return HttpResponse(render(request,'satvik/adminpage.html'))

def notice(request):
	if request.method == 'GET':
		return HttpResponse(render(request,'satvik/notice.html'))
	elif request.method == 'POST':
		notice = request.POST.get('notice')
		with connection.cursor() as cursor:
			cursor.execute('insert into NOTICE (notice) values(%s);',[notice])
		return render(request,'satvik/adminpage.html')
