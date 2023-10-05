import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonTextColor});

  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(fontSize: 18, color: widget.buttonTextColor),
        ),
      ),
    );
  }
}
