import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zahface/API/apis.dart';

import '../utills/common.dart';

class ApiService {

  final Dio _dio = Dio(BaseOptions(
    baseUrl: String.fromEnvironment(baseUrl),
    connectTimeout: const Duration(seconds: 10),
  ));
  final _secureStorage = const FlutterSecureStorage();

  // DioClient() {
  //   // Request interceptor
  //   _dio.interceptors.add(InterceptorsWrapper(
  //     onRequest: (options, handler) async {
  //       try {
  //         final token = await _secureStorage.read(key: 'token');
  //         if (token != null) {
  //           options.headers['Authorization'] = 'Bearer $token';
  //         }
  //       } catch (e) {
  //         print('Error retrieving token: $e');
  //       }
  //       return handler.next(options);
  //     },
  //     onResponse: (response, handler) {
  //       return handler.next(response); // Pass through successful responses
  //     },
  //     onError: (error, handler) {
  //       if (error.response != null) {
  //         if (error.response?.statusCode == 401) {
  //           print('Unauthorized. Please check your token.');
  //           _secureStorage.delete(key: 'token'); // Clear the token
  //         } else if (error.response?.statusCode == 500) {
  //           print('Server error. Please try again later.');
  //         }
  //       } else {
  //         print('No response from server. Please check your connection.');
  //       }
  //       return handler.next(error); // Pass through error
  //     },
  //   ));
  // }

  Dio get dio => _dio;

  /*Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the stored values
    token = prefs.getString('token');
    userId = prefs.getString('id');
    username = prefs.getString('name');
    email = prefs.getString('email');

    print('Token: $token');
    print('User ID: $userId');
    print('Name: $username');
    print('Email: $email');
  }*/


  // Login logic
  Future<void> handleLogin(BuildContext context, String email, String password) async {
    try {
      print("Attempting to login with email: $email");
      final response = await Dio().post(
        login,
        data: {
          'email': email,
          'password': password,
        },
      );

      print("Response received: ${response.data}");

      if (response.data['success'] == true) {
        // Extract token from the response data
        token = response.data['token'];
        print("Extracted token: $token");

        // Extract user data from the response data
        userId = response.data['user']['_id'];
        username = response.data['user']['name'];
        email = response.data['user']['email'];
        print("Extracted user ID: $userId, name: $username, email: $email");

        // Save token and user data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);
        await prefs.setString('id', userId!);
        await prefs.setString('name', username!);
        await prefs.setString('email', email);
        print("Token and user data saved in SharedPreferences");

        // Navigate to the bottomNavBar page
        Navigator.pushReplacementNamed(context, '/bottomNavBar');
      } else {
        print("Login failed. Response data: ${response.data}");
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text('Login failed.'),
          ),
        );
      }
    } on DioError catch (error) {
      print("DioError caught: ${error.message}");
      _showDioErrorDialog(context, error);
    }
  }


  // Register logic
  Future<void> handleSignUp(BuildContext context, String name, String email, String password) async {
    try {
      print("Attempting to register user with name: $name, email: $email");
      final response = await Dio().post(
        register,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      print("Response received: ${response.data}");

      if (response.data['success'] == true) {
        token = response.data['token'];
        print("Extracted token: $token");

        // Extract user data from the response data
        userId = response.data['user']['_id'];
        username = response.data['user']['name'];
        email = response.data['user']['email'];
        print("Extracted user ID: $userId, name: $username, email: $email");

        // Save token and user data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);
        await prefs.setString('id', userId!);
        await prefs.setString('name', username!);
        await prefs.setString('email', email);
        print("Token and user data saved in SharedPreferences");

        // Redirecting to the login page
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        print("Registration failed. Response data: ${response.data}");
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text('Sign-up failed. Please check your details and try again.'),
          ),
        );
      }
    } on DioError catch (error) {
      print("DioError caught: ${error.message}");
      _showDioErrorDialog(context, error);
    }
  }


  // Logout logic
  Future<void> handleLogout(BuildContext context) async {
    try {
      // Access SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Remove the token from SharedPreferences
      await prefs.remove('token');
      await prefs.remove('id');
      await prefs.remove('name');
      await prefs.remove('email');
      print("Token removed from SharedPreferences");

      // Navigate back to the login screen
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error during logout: $e");
      // Show an error dialog if logout fails
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text('An error occurred while logging out. Please try again.'),
        ),
      );
    }
  }

// Helper method to handle Dio errors
  void _showDioErrorDialog(BuildContext context, DioError error) {
    if (error.response != null) {
      print("Error response: ${error.response?.data}");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(
            'Error: ${error.response?.data['message'] ?? error.response?.statusMessage}',
          ),
        ),
      );
    } else if (error.type == DioErrorType.connectionTimeout) {
      print("Connection timeout.");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text('Connection timeout. Please check your network.'),
        ),
      );
    } else {
      print("Error message: ${error.message}");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text('Error: ${error.message}'),
        ),
      );
    }
  }


}