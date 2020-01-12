import 'package:flutter/material.dart';
import 'package:olx_clone/blocs/drawer_bloc.dart';
import 'package:olx_clone/pages/_base/BasePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        home: BasePage(),
        theme: ThemeData(primaryColor: Colors.yellow),
      ),
    );
  }
}
