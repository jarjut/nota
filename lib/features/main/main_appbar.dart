import 'package:flutter/material.dart';

import '../../../../constants/breakpoints.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool automaticallyImplyLeading;
  const MainAppBar(
      {Key? key, this.title, this.automaticallyImplyLeading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading:
          size.width > kDesktopBreakpoint ? false : automaticallyImplyLeading,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
