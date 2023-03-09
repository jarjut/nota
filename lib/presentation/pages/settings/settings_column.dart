import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/theme/theme_cubit.dart';
import 'package:nota/presentation/l10n/l10n.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({super.key});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(context.l10n.settingsThemeTitle),
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return DropdownButton(
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  value: state,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      context.read<ThemeCubit>().setThemeMode(value);
                    }
                  },
                  items: <ThemeMode>[
                    ThemeMode.system,
                    ThemeMode.light,
                    ThemeMode.dark
                  ]
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child:
                              Text(value.toString().substring(10).capitalize()),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
