import 'package:dashboard/util/app_colors.dart';
import 'package:dashboard/widgets/icon_text_button.dart';
import 'package:dashboard/widgets/input/dropdown_input.dart';
import 'package:dashboard/widgets/input/scrollable_integer_selector.dart';
import 'package:dashboard/widgets/input/single_select_double_toggle.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);
  static final String ROUTE = 'FORM_SCREEN_ROUTE';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool showRoomInput = true;

  bool showEquipmentInput = false;

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
            SingleSelectDoubleToggle(
              label: 'Location',
              onToggle: (int choice) {
                setState(() {
                  if (choice == 0) {
                    // user chosen Room
                    showEquipmentInput = false;
                    showRoomInput = true;
                  } else {
                    // user chosen Equipment
                    showEquipmentInput = true;
                    showRoomInput = false;
                  }
                });
              },
              children: ['Room', 'Equipment'],
            ),
            DropdownInput(
              label: 'Room',
              addable: true,
              withBookmark: false,
              visible: showRoomInput,
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
              label: 'Equipment',
              addable: true,
              withBookmark: false,
              visible: showEquipmentInput,
              items: [
                'Equipment 1.01',
                'Equipment 1.02',
                'Equipment 1.03',
                'Equipment 2.01',
                'Equipment 3.01',
                'Equipment 3.02',
                'Equipment 4.01',
              ],
            ),
            SingleSelectDoubleToggle(
              label: 'Position',
              onToggle: (int choice) {},
              children: ['Inside', 'Outside'],
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
