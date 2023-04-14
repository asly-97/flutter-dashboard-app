import 'package:flutter/material.dart';

class ClosableTextCard extends StatefulWidget {
  ClosableTextCard(this.title);

  final String title;

  @override
  State<ClosableTextCard> createState() => _ClosableTextCardState();
}

class _ClosableTextCardState extends State<ClosableTextCard> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
