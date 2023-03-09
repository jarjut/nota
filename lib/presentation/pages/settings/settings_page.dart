import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/presentation/l10n/l10n.dart';
import 'package:nota/presentation/pages/main/main_app_bar.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';
import 'package:nota/presentation/pages/settings/settings_column.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: MainAppBar(
        title: Text(context.l10n.settingsPageTitle),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: const SizedBox(
          width: 600,
          child: SettingsColumn(),
        ),
      ),
    );
  }
}
