import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zahface/screens/auth/register.dart';

import '../../API/auth_service.dart';
import '../../providers/auth_providers.dart';
import '../../utills/common.dart';
import '../../widget/custom_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _phonePasswordController = TextEditingController();

  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: black.withOpacity(0.3),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: white,
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  controller: _tabController,
                  indicatorColor: white,
                  labelColor: white,
                  indicatorWeight: 3.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.white70,
                  tabs: const [
                    Tab(text: "Email"),
                    Tab(text: "Phone"),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: height * 0.4,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _emailPasswordTab(),
                      _phonePasswordTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailPasswordTab() {
    bool isObscure = Provider.of<AuthProviders>(context).isObscure;
    final authProviders = Provider.of<AuthProviders>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: "jhon@example.com",
            label: "Email",
            icon: Icons.email,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            isPassword: true,
            passwordIcon: isObscure ? Icons.visibility : Icons.visibility_off,
            onPressed: (){
              authProviders.isObscure = !authProviders.isObscure;
            },
            controller: _passwordController,
            hintText: "Enter your password",
            label: "Password",
            icon: Icons.lock,
            obscureText: isObscure,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Login",
            onPressed: () {
              // Handle email login logic
              _apiService.handleLogin(context, _emailController.text, _passwordController.text);
            },
          ),
          const SizedBox(height: 10),
          _sigUpText(),
        ],
      ),
    );
  }

  Widget _phonePasswordTab() {
    bool isObscure = Provider.of<AuthProviders>(context).isObscure;
    final authProviders = Provider.of<AuthProviders>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: _phoneNumberController,
            hintText: "Enter your phone number",
            label: "Phone",
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            isPassword: true,
            passwordIcon: isObscure ? Icons.visibility : Icons.visibility_off,
            onPressed: (){
              authProviders.isObscure = !authProviders.isObscure;
            },
            controller: _phonePasswordController,
            hintText: "Enter your password",
            label: "Password",
            icon: Icons.lock,
            obscureText: isObscure,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Login",
            onPressed: () {
              // Handle phone login logic
            },
          ),
          const SizedBox(height: 10),
          _sigUpText(),
        ],
      ),
    );
  }

  Widget _sigUpText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an Account?",
          style: TextStyle(
            fontSize: 14,
            color: white,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
          },
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: 14,
              color: Color(4281011007),
            ),
          ),
        ),
      ],
    );
  }
}
