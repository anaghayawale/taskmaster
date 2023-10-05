import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';
import 'package:taskmaster/widgets/custom_button.dart';
import 'package:taskmaster/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/images/clipboard.png'),
                const SizedBox(height: 10.0),
                Text(
                  'Taskmaster',
                  style: TextStyle(
                    color: Constants().pinkColor(),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your personal task manager',
                  style: TextStyle(
                    color: Constants().blueColor(),
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 25.0),
                const CustomTextField(hintText: 'Email'),
                const SizedBox(height: 10.0),
                const CustomTextField(hintText: 'Password'),
                const SizedBox(height: 10.0),
                CustomButton(
                  buttonName: 'Login',
                  buttonColor: Constants().kLoginButtonColor(),
                  buttonTextColor: Constants().kLoginButtonTextColor(),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'OR',
                  style:
                      TextStyle(color: Constants().greyColor(), fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Constants().blueColor(),
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: Constants().pinkColor(),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}