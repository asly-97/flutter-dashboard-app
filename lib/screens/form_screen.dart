import 'package:dashboard/util/app_colors.dart';
import 'package:dashboard/widgets/icon_text_button.dart';
import 'package:dashboard/widgets/input/dropdown_input.dart';
import 'package:dashboard/widgets/input/scrollable_integer_selector.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ScrollableIntegerSelector(
              label: 'Level',
              start: -2,
              end: 10,
            ),
            DropdownInput(
              label: 'Room',
              addable: true,
              withBookmark: false,
              items: [
                'Room 1.01',
                'Room 1.02',
                'Room 1.03',
                'Room 2.01',
                'Room 3.01',
                'Room 3.02',
                'Room 4.01',
                'Room 4.02',
                'Room 4.03',
                'Room 4.04',
              ],
            ),
            DropdownInput(
              label: 'Time expected to complete the job',
              showInfoIcon: false,
              withBookmark: false,
              items: [
                '5 Minutes',
                '10 Minutes',
                '15 Minutes',
                '30 Minutes',
                '35 Minutes',
                '40 Minutes',
                '45 Minutes',
                '50 Minutes',
                '55 Minutes',
                '60 Minutes',
              ],
            ),
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
