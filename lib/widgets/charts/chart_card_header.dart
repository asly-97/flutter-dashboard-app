import 'package:flutter/material.dart';

class ChartCardHeader extends StatelessWidget {
  const ChartCardHeader({
    required this.title,
    required this.subTitle,
    required this.onFilter,
  });

  final String title;
  final String subTitle;
  final Function() onFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subTitle,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onFilter,
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
