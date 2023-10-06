import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';
import 'package:taskmaster/widgets/custom_button.dart';
import 'package:taskmaster/widgets/custom_snackbar.dart';
import 'package:taskmaster/widgets/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    setState(() {
    isLoading = true;
  });
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      CustomSnackBar(
        snackbarText: 'Please enter all the fields',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
    } else if (!EmailValidator.validate(email)) {
      CustomSnackBar(
        snackbarText: 'Please enter a valid email',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
    } else if (password.length < 6) {
      CustomSnackBar(
        snackbarText: 'Password must be at least 6 characters',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
    } else {
      await loginUser(email, password);
    }
    
  }

  Future<void> loginUser(String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie':
            'taskmastertoken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MTk4MDQ1MzMzZDZhYjkxZDBjZDYyZSIsImlhdCI6MTY5NjU4MTEyOX0.CDigBgGA_Zo9pjKdyFGOuZSJiIlbGOlf6qW4jQxGI4U'
      };
      var request = http.Request(
        'POST',
        Uri.parse('${Constants.apiBaseUrl}login'),
      );

      request.body = jsonEncode({
        "email": email,
        "password": password,
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);

        if (data['success']) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          CustomSnackBar(
            snackbarText: data['error'],
            snackbarTextColor: Constants().kErrorColor(),
          ).showSnackBar(context);
        }
      } else {
        CustomSnackBar(
          snackbarText: 'Unable to login.Try again',
          snackbarTextColor: Constants().kErrorColor(),
        ).showSnackBar(context);
      }
    } catch (error) {
      CustomSnackBar(
        snackbarText: 'Error: $error',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
    }
  }

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
                CustomTextField(hintText: 'Email', controller: emailController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Password', controller: passwordController),
                const SizedBox(height: 10.0),
                CustomButton(
                  buttonName: 'Login',
                  buttonColor: Constants().kLoginButtonColor(),
                  buttonTextColor: Constants().kLoginButtonTextColor(),
                  onPressed: _login,
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
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Constants().blueColor(),
                        fontSize: 20.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Constants().pinkColor(),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
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
