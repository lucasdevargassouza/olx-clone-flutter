import 'package:flutter/material.dart';
import 'package:olx_clone/blocs/drawer_bloc.dart';
import 'package:provider/provider.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBloc _drawerBloc = Provider.of<DrawerBloc>(context);

    void _setPage(int page) {
      _drawerBloc.setPage(page);
      if (MediaQuery.of(context).orientation == Orientation.portrait)
        Navigator.of(context).pop();
    }

    return StreamBuilder<int>(
      stream: _drawerBloc.outCurrentPage,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            IconTile(
              label: "Anúncios",
              icon: Icons.list,
              isSelected: snapshot.data == 0,
              onTap: () => _setPage(0),
            ),
            IconTile(
              label: "Inserir anúncios",
              icon: Icons.edit,
              isSelected: snapshot.data == 1,
              onTap: () => _setPage(1),
            ),
            IconTile(
              icon: Icons.chat,
              isSelected: snapshot.data == 2,
              label: "Chat",
              onTap: () => _setPage(2),
            ),
            IconTile(
              icon: Icons.favorite,
              label: "Favoritos",
              isSelected: snapshot.data == 3,
              onTap: () => _setPage(3),
            ),
            IconTile(
              label: "Minha conta",
              icon: Icons.person,
              isSelected: snapshot.data == 4,
              onTap: () => _setPage(4),
            ),
          ],
        );
      }
    );
  }
}
