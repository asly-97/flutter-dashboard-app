import 'package:dashboard/util/app_colors.dart';
import 'package:dashboard/widgets/icon_text_button.dart';
import 'package:dashboard/widgets/input/dropdown_input.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            DropdownInput(
              label: 'Site',
              items: [
                'Site 001',
                'Site 002',
                'Site 003',
                'Site 004',
                'Site 005',
              ],
            ),
            DropdownInput(
              label: 'Zone',
              items: [
                'Zone 201',
                'Zone 202',
                'Zone 203',
                'Zone 204',
              ],
            ),
            TextField(),
            TextField(),
            TextField(),
            IconTextButton(
              onClick: () {
                Navigator.pop(context);
              },
              icon: Icons.send,
              text: 'Send alert',
            ),
          ],
        ),
      ),
    );
  }
}
