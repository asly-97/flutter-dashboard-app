import 'package:dashboard/util/app_colors.dart';
import 'package:flutter/material.dart';

class FilterPopup extends StatelessWidget {
  const FilterPopup();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.only(
          left: 20,
          right: 28,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
                Text(
                  'Filter by',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text('Date'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.layers_outlined),
                  title: Text('Type'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text('Status'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.category_outlined),
                  title: Text('Category'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.account_tree_outlined),
                  title: Text('Subategory'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.sell_outlined),
                  title: Text('Tags'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
