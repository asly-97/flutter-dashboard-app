import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
This widget contains a scrollable list of integers,
each displayed in a square, and that the user can select a value
from the list using swipe gestures or arrow buttons.
 */

enum ControllerDirection { back, forward }

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

  ScrollController controller = ScrollController(debugLabel: 'Hey');

  @override
  void initState() {
    super.initState();
    selectedItem = widget.start;
  }

  Widget buildController(ControllerDirection direction) {
    return IconButton(
      iconSize: 16,
      onPressed: () {
        //Calculating scroll step
        int itemsCount = widget.end - widget.start + 1;
        double maxWidth = controller.position.maxScrollExtent;
        double step = maxWidth / itemsCount;

        //calculate target offset depending on the direction
        double currentOffset = controller.offset;
        double targetOffset;
        if (direction == ControllerDirection.back) {
          targetOffset = currentOffset - step;
          //sets to zero in case reaches the start
          targetOffset = targetOffset < 0 ? 0 : targetOffset;
        } else {
          targetOffset = currentOffset + step;
          //sets to max value in case reaches the end
          double maxOffset = controller.position.maxScrollExtent;
          targetOffset = targetOffset > maxOffset ? maxOffset : targetOffset;
        }
        controller.jumpTo(targetOffset);
        print('Scrolling: ${controller.offset}');
      },
      icon: Icon(
        direction == ControllerDirection.back
            ? Icons.arrow_back_ios_outlined
            : Icons.arrow_forward_ios_outlined,
      ),
    );
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
            buildController(ControllerDirection.back),
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
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
            buildController(ControllerDirection.forward),
          ],
        ),
      ],
    );
  }
}
