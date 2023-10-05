import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';
import 'package:taskmaster/widgets/custom_button.dart';
import 'package:taskmaster/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                CustomTextField(hintText: 'Name', controller: nameController),
                const SizedBox(height: 10.0),
                CustomTextField(hintText: 'Email', controller: emailController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Password', controller: passwordController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController),
                const SizedBox(height: 10.0),
                CustomButton(
                  buttonName: 'Login',
                  buttonColor: Constants().kLoginButtonColor(),
                  buttonTextColor: Constants().kLoginButtonTextColor(),
                  onPressed: () {},
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
                      'Already have an account?',
                      style: TextStyle(
                        color: Constants().blueColor(),
                        fontSize: 20.0,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log in',
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
