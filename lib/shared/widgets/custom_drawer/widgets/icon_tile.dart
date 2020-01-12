import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final IconData icon;
  final String label;

  IconTile({Key key, this.label, this.icon, this.onTap, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.label, style: Theme.of(context).textTheme.subtitle),
      leading: Icon(this.icon),
      selected: isSelected,
      onTap: onTap,
    );
  }
}
