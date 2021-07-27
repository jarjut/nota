import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../main_appbar.dart';
import '../main_wrapper.dart';
import 'settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
        appBar: MainAppBar(
          title: const Text('Settings'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              if (VRouter.of(context).historyCanBack()) {
                VRouter.of(context).historyBack();
              } else {
                VRouter.of(context).pop();
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const SizedBox(
            width: 600,
            child: SettingsColumn(),
          ),
        ));
  }
}
