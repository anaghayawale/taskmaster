import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    Key? key,
    required this.snackbarText,
    required this.snackbarTextColor,
  }) : super(key: key);

  final String snackbarText;
  final Color snackbarTextColor;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackbarText,
          style: TextStyle(
            color: snackbarTextColor,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: snackbarTextColor.withOpacity(0.2),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
      ),
    );
  }
}
