import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';

class CustomSearchBox extends StatefulWidget {
  const CustomSearchBox(
      {super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomSearchBox> createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        suffixIcon: const Icon(Icons.search_rounded),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Constants().blueColor(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
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
