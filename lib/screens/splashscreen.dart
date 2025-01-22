import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utills/common.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    userId = prefs.getString('id');
    username = prefs.getString('name');
    email = prefs.getString('email');

    print('Token: $token');
    print('User ID: $userId');
    print('Name: $username');
    print('Email: $email');
    if (token != null) {
      Navigator.pushReplacementNamed(context, '/bottomNavBar');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
