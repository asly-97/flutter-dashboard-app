import 'package:dashboard/widgets/charts/card_header/filter_popup.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
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
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return FilterPopup();
                });
          },
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
