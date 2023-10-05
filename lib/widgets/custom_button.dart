import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonTextColor, 
      required this.onPressed});

  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
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
      ),
    );
  }
}
