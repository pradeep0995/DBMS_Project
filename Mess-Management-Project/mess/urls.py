"""mess URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from satvik import views

urlpatterns = [
	url(r'^$', views.index, name='index'),
	url(r'^menu/$', views.menu, name='menu'),
	url(r'^login/$', views.login, name='login'),
	url(r'^logout/$', views.logout, name='logout'),
	url(r'^enroll/$', views.enroll, name='enroll'),
	url(r'^signup/$', views.signup, name='signup'),
	url(r'^login/facility/$', views.facility, name='facility'),
	url(r'^login/facility/complaint/$', views.complaint, name='rcomplaint'),
	url(r'^login/facility/view_complaint/$', views.oldcomplaint, name='pcomplaint'),
	url(r'^login/facility/feedback/$', views.feedback, name='gfeed'),
	url(r'^login/facility/view_feedback/$', views.oldfeedback, name='pfeed'),

	url(r'^adminlogin/$', views.adminlogin, name='admin'),
	url(r'^adminlogin/notice$', views.notice, name='notice'),
	url(r'^adminlogin/viewstaff/$', views.vstaff, name='viewstaff'),
	url(r'^adminlogin/viewstudent/$', views.vstudent, name='viewstudent'),
	url(r'^adminlogin/viewinventory/$', views.vinventory, name='viewinventory'),

	url(r'^adminlogin/addstaff/$', views.addstaff, name='astaff'),
	url(r'^adminlogin/removestaff/$', views.removestaff, name='rstaff'),
	url(r'^adminlogin/addinventory/$', views.addinventory, name='ainventory'),

    url(r'^admin/', admin.site.urls),
]
