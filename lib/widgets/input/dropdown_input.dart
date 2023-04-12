import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

final InputDecoration inputDecoration = InputDecoration(
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
);

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
  final bool withBookmark;
  final bool showInfoIcon;
  final bool visible;
  List<SelectionItem> selectionItems = [];

  DropdownInput({
    required this.label,
    required List<String> items,
    this.addable = false,
    this.withBookmark = true,
    this.showInfoIcon = true,
    this.visible = true,
  }) {
    //initialize selection items
    print('initialize selection items');
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
    print('initState');
  }

  //build the dropdown item
  DropdownMenuItem buildItem(SelectionItem item) {
    return DropdownMenuItem(
      child: Row(
        children: [
          Text(item.title),
          if (widget.withBookmark)
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
      decoration: inputDecoration,
      items: widget.selectionItems.map((item) => buildItem(item)).toList(),
      onChanged: (item) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      maintainState: true,
      child: Padding(
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
                if (widget.showInfoIcon && !widget.addable)
                  Icon(
                    Icons.info_outline,
                    color: AppColors.midGrey,
                    size: 18,
                  ),
                if (widget.addable)
                  GestureDetector(
                    onTap: () async {
                      //show dialog
                      List<String>? inputs = await showTextInputDialog(
                          title: 'Add New ${widget.label} item',
                          context: context,
                          textFields: [
                            DialogTextField(),
                          ]);

                      if (inputs != null) {
                        //Adding New Item To The Dropdown List
                        int id = widget.selectionItems.last.id + 1;
                        String title = inputs[0];
                        setState(() {
                          widget.selectionItems
                              .add(SelectionItem(id: id, title: title));
                        });
                      }
                    },
                    child: Text(
                      '+add',
                      style: TextStyle(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4),
            buildDropdownButton(),
          ],
        ),
      ),
    );
  }
}
