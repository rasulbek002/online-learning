import 'package:flutter/material.dart';

class SelectItem extends StatelessWidget {
  final String text;
  final String image;
  final bool showIcon;

  const SelectItem(
      {super.key, required this.text, this.image = '', this.showIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 24, top: 5, bottom: 5, end: 24),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24.0),
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
          Text(
            text,
            style: const TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
