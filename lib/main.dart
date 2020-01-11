import 'package:flutter/material.dart';
import 'package:olx_clone/pages/base/BasePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        home: BasePage(),
      ),
    );
  }
}
