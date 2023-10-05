import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.buttonName});

  final String buttonName;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          color: Constants().kSignupButtonColor(),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(
              fontSize: 18, color: Constants().kSignupButtonTextColor()),
        ),
      ),
    );
  }
}
