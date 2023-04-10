import 'package:flutter/material.dart';

class ClosableTextCard extends StatelessWidget {
  ClosableTextCard(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.close,
                color: Colors.grey,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
