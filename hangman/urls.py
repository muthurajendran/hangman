from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

import debug_toolbar

urlpatterns = patterns('',
    url(r'', include('social_auth.urls'), name='django_social_auth'),
    url(r'^__debug__/', include(debug_toolbar.urls)),

    # Examples:
    # url(r'^$', 'hangman.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
