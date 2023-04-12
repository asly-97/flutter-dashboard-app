import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

class SingleSelectDoubleToggle extends StatefulWidget {
  SingleSelectDoubleToggle({
    required this.label,
    required this.children,
    required this.onToggle,
    this.selectedIndex = 0,
  });

  final String label;
  final List<String> children;
  final int selectedIndex;
  // Argument value of 1 is for the first choice and 2 for the second
  final void Function(int choice) onToggle;

  @override
  State<SingleSelectDoubleToggle> createState() =>
      _SingleSelectDoubleToggleState();
}

class _SingleSelectDoubleToggleState extends State<SingleSelectDoubleToggle> {
  late int _selectedChoice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.selectedIndex >= 0 &&
        widget.selectedIndex < widget.children.length) {
      _selectedChoice = widget.selectedIndex;
    } else {
      _selectedChoice = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              for (int i = 0; i < widget.children.length; i++)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedChoice = i;
                        widget.onToggle(i);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: i == _selectedChoice
                            ? AppColors.purple
                            : AppColors.white,
                        border: Border.all(
                          color: AppColors.grey,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.children[i],
                          style: TextStyle(
                            color: i == _selectedChoice
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
        ],
      ),
    );
  }
}
