import 'package:flutter/material.dart';
import 'package:nota/features/main/search_app_bar.dart';

import '../../../../constants/breakpoints.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  const MainAppBar({
    Key? key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > kDesktopBreakpoint;

    if (isDesktop) {
      return SearchAppBar(
        title: title,
        actions: actions,
      );
    } else {
      return AppBar(
        automaticallyImplyLeading:
            isDesktop ? false : automaticallyImplyLeading,
        leading: leading,
        title: title,
        actions: actions,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
