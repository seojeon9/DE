from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from account.forms import UserForm
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token


# Create your views here.
def signup(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()

            user_name = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user_name, password=raw_password)
            login(request, user)
            return redirect('/')
    else:
        form = UserForm()

    return render(request, 'account/signup.html', {'form': form})


@login_required(login_url='account:login')
def get_apikey(request):
    token = Token.objects.get_or_create(user=request.user)
    return render(request, 'account/apikey.html', {'apikey': token[0]})
