from django.urls import include, path
from rest_framework import routers
from rest_api import views as rest_view
from . import views
from drf_yasg import openapi
from drf_yasg.views import get_schema_view


router = routers.DefaultRouter()
router.register(r'corona/facility', rest_view.CoFacilityViewSet)
router.register(r'corona/population-density', rest_view.CoPopuDensityViewSet)
router.register(r'corona/vaccine', rest_view.CoVaccineViewSet)
router.register(r'corona/weekday', rest_view.CoWeekdayViewSet)

schema_view = get_schema_view(
    openapi.Info(
        title="CORONA_API",
        default_version='v2',
        description="CORONA_API description",
    ),
    public=True,
)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('', views.index),
    path('', include(router.urls)),
    path('account/', include('account.urls')),
    path('doc/', schema_view.with_ui('swagger', cache_timeout=0), name='doc'),
]
