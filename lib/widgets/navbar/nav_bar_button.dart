import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton(this.icon, {this.isActive = false});

  final IconData icon;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    //Give the button a specific color
    // in order to indicate whether it's active or not
    Color color = isActive ? AppColors.blue : AppColors.grey;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: color.withOpacity(.2),
          padding: EdgeInsets.all(8),
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
