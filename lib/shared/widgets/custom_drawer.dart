import 'package:flutter/material.dart';
import 'package:olx_clone/shared/widgets/custom_drawer/widgets/custom_header.dart';
import 'package:olx_clone/shared/widgets/custom_drawer/widgets/icon_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomHeader(),
            IconSection(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
