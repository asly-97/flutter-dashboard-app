import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

//Stores data of each DropdownMenuItem.
class SelectionItem {
  final int id;
  final String title;
  bool bookmarked;

  SelectionItem({
    required this.id,
    required this.title,
    this.bookmarked = false,
  });
}

class DropdownInput extends StatefulWidget {
  final String label;
  final bool addable;
  List<SelectionItem> selectionItems = [];

  DropdownInput(
      {required this.label,
      required List<String> items,
      this.addable = false}) {
    //initialize selection items
    int i = 100;
    for (var item in items) {
      selectionItems.add(SelectionItem(
        id: i,
        title: item,
      ));
      i++;
    }
  }

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  late int selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialize the list withe first item by default
    selectedItem = widget.selectionItems.first.id;
  }

  //build the dropdown item
  DropdownMenuItem buildItem(SelectionItem item) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Text(item.title),
          IconButton(
              onPressed: () {
                setState(() {
                  item.bookmarked = !item.bookmarked;
                });
              },
              icon: Icon(
                Icons.bookmark,
                color: item.bookmarked ? AppColors.yellow : AppColors.midGrey,
              )),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      value: item.id,
    );
  }

  //build the dropdown button
  Widget buildDropdownButton() {
    return DropdownButtonFormField(
      isExpanded: true,
      isDense: false,
      value: selectedItem,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
      items: widget.selectionItems.map((item) => buildItem(item)).toList(),
      onChanged: (item) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.info_outline,
                color: AppColors.midGrey,
                size: 18,
              ),
            ],
          ),
          SizedBox(height: 4),
          buildDropdownButton(),
        ],
      ),
    );
  }
}
