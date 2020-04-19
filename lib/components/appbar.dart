import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      title: Text('Phone to Desk'),
      backgroundColor: Colors.pink[300],
    );
  }
}
