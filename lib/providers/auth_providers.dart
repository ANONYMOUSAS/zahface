import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier{
  bool _isLogged = false;
  bool _isObscure = true;

  bool get isObscure => _isObscure;
  bool get isLogged => _isLogged;

  set isLogged(bool value){
    _isLogged = value;
    notifyListeners();
  }

  set isObscure(bool value){
    _isObscure = value;
    notifyListeners();
  }
}