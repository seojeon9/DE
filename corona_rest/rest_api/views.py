from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from rest_api.models import *
from rest_api.serializers import *


class CoFacilityViewSet(viewsets.ModelViewSet):
    queryset = CoFacility.objects.all().order_by('-std_day')
    serializer_class = CoFacilitySerializer
    # permission_classes = [permissions.IsAuthenticated]


class CoPopuDensityViewSet(viewsets.ModelViewSet):
    queryset = CoPopuDensity.objects.all().order_by('-std_day')
    serializer_class = CoPopuDensitySerializer
    # permission_classes = [permissions.IsAuthenticated]


class CoVaccineViewSet(viewsets.ModelViewSet):
    queryset = CoVaccine.objects.all().order_by('-std_day')
    serializer_class = CoVaccineSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CoWeekdayViewSet(viewsets.ModelViewSet):
    queryset = CoWeekday.objects.all().order_by('-std_day')
    serializer_class = CoWeekdaySerializer
    # permission_classes = [permissions.IsAuthenticated]
