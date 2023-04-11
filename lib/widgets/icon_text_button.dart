import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton({
    required this.onClick,
    required this.icon,
    required this.text,
  });

  final Function() onClick;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.send),
            SizedBox(
              width: 20,
            ),
            Text(
              'Send alert',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
