import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'app_route.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'Nota',
      theme: theme,
      routes: [AppRoute(context)],
    );
  }
}
