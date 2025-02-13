import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final int bgColor;
  final Color textColor;

  const MainButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(bgColor),
              ),
              foregroundColor: MaterialStateProperty.all(textColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
              ),
            ),
            child: Text(buttonText)));
  }
}
