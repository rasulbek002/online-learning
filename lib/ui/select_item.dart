import 'package:flutter/material.dart';

class SelectItem extends StatelessWidget {
  final String text;
  final String image;
  final bool showIcon;
  final Color backgroundColor; // For setting the background color
  final VoidCallback onClick;   // For handling the onClick action

  const SelectItem({
    super.key,
    required this.text,
    this.image = '',
    this.showIcon = false,
    this.backgroundColor = Colors.grey, // Default background color
    required this.onClick, // Action when tapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick, // Handle onTap click action
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            start: 24, top: 5, bottom: 5, end: 24),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(// Set the background color from props
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: backgroundColor, width: 2.0),
        ),
        child: Row(
          children: [
            if (showIcon) ...[
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 24.0),
            ],
            Expanded( // Allows text to wrap properly
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true, // Allows wrapping
                overflow: TextOverflow.visible, // Ensures text isn't clipped
              ),
            ),
          ],
        ),
      ),
    );
  }
}
