import 'package:flutter/material.dart';
import 'package:nota/core/constants/breakpoints.dart';
import 'package:nota/presentation/pages/main/search_app_bar.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.leading,
  });
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

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
        automaticallyImplyLeading: !isDesktop && automaticallyImplyLeading,
        leading: leading,
        title: title,
        actions: actions,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
