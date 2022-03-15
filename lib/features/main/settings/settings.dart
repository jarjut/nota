import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_cubit.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({Key? key}) : super(key: key);

  @override
  _SettingsColumnState createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text('App Theme'),
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
                      BlocProvider.of<ThemeCubit>(context).setTheme(value);
                    }
                  },
                  items: <ThemeMode>[ThemeMode.system, ThemeMode.light, ThemeMode.dark]
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.toString().substring(10).capitalize()),
                          ))
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
