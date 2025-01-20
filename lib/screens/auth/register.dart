import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../utills/common.dart';
import '../../utills/custom_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _phonePasswordController = TextEditingController();
  final TextEditingController _phoneUsernameController = TextEditingController();

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
                  "Register",
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
                  height: height * 0.5,
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
            controller: _usernameController,
            hintText: "Enter your Full Name",
            label: "Name",
            icon: Icons.person,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
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
            text: "Register",
            onPressed: () {
              // Handle email login logic
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
            controller: _phoneUsernameController,
            hintText: "Enter your Full Name",
            label: "Name",
            icon: Icons.person,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
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
            text: "Register",
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
          "Already have an Account?",
          style: TextStyle(
            fontSize: 14,
            color: white,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Login",
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
