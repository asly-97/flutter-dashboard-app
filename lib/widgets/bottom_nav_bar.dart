import 'package:dashboard/widgets/nav_bar_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavBarButton(Icons.dashboard, isActive: true),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            //used to space the two sides evenly
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavBarButton(Icons.remove_red_eye),
                  NavBarButton(Icons.image_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
