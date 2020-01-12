import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olx_clone/blocs/drawer_bloc.dart';
import 'package:olx_clone/pages/anuncios/anuncio_page.dart';
import 'package:olx_clone/pages/chat/chat_page.dart';
import 'package:olx_clone/pages/favoritos/favoritos_page.dart';
import 'package:olx_clone/pages/inseriranuncio/inseriranuncios_page.dart';
import 'package:olx_clone/pages/minhaconta/minhaconta_page.dart';
import 'package:olx_clone/shared/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  StreamSubscription _streamSubscription;
  bool _isOpenLandscapeDrawer = false;
  DrawerBloc _drawerBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if (_drawerBloc != drawerBloc) {
      _drawerBloc = drawerBloc;

      _streamSubscription?.cancel();
      _streamSubscription = _drawerBloc.outCurrentPage.listen((data) {
        _pageController.jumpToPage(data);
      });
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isOrientationLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text("OLX"),
        leading: _isOrientationLandscape
            ? IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _isOpenLandscapeDrawer = !_isOpenLandscapeDrawer;
                  });
                },
              )
            : null,
      ),
      drawer: _isOrientationLandscape ? null : CustomDrawer(),
      body: Row(
        children: <Widget>[
          Flexible(
            flex: _isOrientationLandscape && _isOpenLandscapeDrawer ? 1 : 0,
            child: _isOrientationLandscape && _isOpenLandscapeDrawer ? CustomDrawer() : Container(),
          ),
          Flexible(
            flex: 2,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                AnunciosPage(),
                InserirAnunciosPage(),
                ChatPage(),
                FavoritosPage(),
                MinhaContaPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
