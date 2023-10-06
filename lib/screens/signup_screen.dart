import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';
import 'package:taskmaster/widgets/custom_button.dart';
import 'package:taskmaster/widgets/custom_snackbar.dart';
import 'package:taskmaster/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isButtonDisabled = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _signup() async {
    if (isButtonDisabled) return;
    setState(() {
      isButtonDisabled = true;
    });
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      CustomSnackBar(
        snackbarText: 'Please enter all the fields',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
      setState(() {
        isButtonDisabled = false;
      });
      return;
    }
    if (!EmailValidator.validate(email)) {
      CustomSnackBar(
        snackbarText: 'Please enter a valid email',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
      setState(() {
        isButtonDisabled = false;
      });
      return;
    }
    if (password.length < 6) {
      CustomSnackBar(
        snackbarText: 'Password must be at least 6 characters',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
      setState(() {
        isButtonDisabled = false;
      });
      return;
    }
    if (password != confirmPassword) {
      CustomSnackBar(
        snackbarText: 'Passwords do not match',
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
      setState(() {
        isButtonDisabled = false;
      });
      return;
    }

    try {
      await signUpUser(name, email, password);
      setState(() {
        isButtonDisabled = false;
      });
    } catch (error) {
      CustomSnackBar(
        snackbarText: error.toString(),
        snackbarTextColor: Constants().kErrorColor(),
      ).showSnackBar(context);
      setState(() {
        isButtonDisabled = false;
      });
    }
  }

  Future signUpUser(String name, String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('${Constants.apiBaseUrl}signup'),
    );

    request.body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      if (data['success']) {
        CustomSnackBar(
          snackbarText: 'Signed up successfully',
          snackbarTextColor: Constants().kSuccessColor(),
        ).showSnackBar(context);
        Navigator.pop(context);
      } else {
        CustomSnackBar(
          snackbarText: '${data['message']}',
          snackbarTextColor: Constants().kErrorColor(),
        ).showSnackBar(context);
        print(data['message']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Image.asset(
                  'assets/images/cornerImage.png',
                  width: 350.0,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50.0),
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
                      CustomTextField(
                          hintText: 'Name', controller: nameController),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                          hintText: 'Email', controller: emailController),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                          hintText: 'Password', controller: passwordController),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                          hintText: 'Confirm Password',
                          controller: confirmPasswordController),
                      const SizedBox(height: 10.0),
                      CustomButton(
                        buttonName: 'Sign up',
                        buttonColor: Constants().kLoginButtonColor(),
                        buttonTextColor: Constants().kLoginButtonTextColor(),
                        onPressed: _signup,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'OR',
                            style: TextStyle(
                                color: Constants().greyColor(), fontSize: 15.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Constants().blueColor(),
                              fontSize: 20.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
