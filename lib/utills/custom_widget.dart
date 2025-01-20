import 'package:flutter/material.dart';

import 'common.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData icon;
  final IconData? passwordIcon;
  final VoidCallback? onPressed;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.passwordIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: white),
        suffixIcon: isPassword ? IconButton(onPressed: onPressed, icon: Icon(passwordIcon, color: white,)) : null,
        labelText: label,
        labelStyle: TextStyle(color: white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(4281011007),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 80.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}