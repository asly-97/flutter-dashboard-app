import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);
  static final String ROUTE = 'FORM_SCREEN_ROUTE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.lightGrey,
        foregroundColor: AppColors.mainTextColor,
        title: const Text('Manuel alert'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.turn_left_sharp),
          ),
        ],
      ),
    );
  }
}
