import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.hintText == 'Password' || widget.hintText == 'Confirm Password' ? true : false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Constants().blueColor(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Constants().pinkColor(),
          ),
        ),
        label: Text(widget.hintText),
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      controller: widget.controller,
    );
  }
}
