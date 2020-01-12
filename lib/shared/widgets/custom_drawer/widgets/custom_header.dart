import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orientation = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      height: _orientation ? 150 : 110,
      padding: EdgeInsets.only(top: _orientation ? 40 : 0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.person, color: Theme.of(context).primaryTextTheme.subtitle.color, size: 50),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Acesse sua conta agora",
                style: Theme.of(context).primaryTextTheme.subtitle,
                overflow: TextOverflow.clip,
              ),
              Text(
                "Clique aqui",
                overflow: TextOverflow.clip,
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
