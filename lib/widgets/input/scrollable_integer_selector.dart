import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

/*
This widget contains a scrollable list of integers,
each displayed in a square, and that the user can select a value
from the list using swipe gestures or arrow buttons.
 */

class ScrollableIntegerSelector extends StatefulWidget {
  final String label;
  final int start;
  final int end;

  ScrollableIntegerSelector({
    required this.label,
    required this.start,
    required this.end,
  });

  @override
  State<ScrollableIntegerSelector> createState() =>
      _ScrollableIntegerSelectorState();
}

class _ScrollableIntegerSelectorState extends State<ScrollableIntegerSelector> {
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.start;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
              iconSize: 16,
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_outlined,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = widget.start; i <= widget.end; i++)
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = i;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: i == selectedItem
                                  ? AppColors.purple
                                  : AppColors.white,
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                i.toString(),
                                style: TextStyle(
                                  color: i == selectedItem
                                      ? AppColors.white
                                      : AppColors.mainTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            IconButton(
              iconSize: 16,
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
