import 'package:flutter/material.dart';
import 'package:nota/widgets/responsive_layout.dart';

import '../../constants/breakpoints.dart';
import '../../widgets/app_drawer.dart';

class MainWrapper extends StatelessWidget {
  final Widget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

  const MainWrapper({
    Key? key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.drawer = const AppDrawer(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= kDesktopBreakpoint;
    return Scaffold(
      appBar: isDesktop
          ? null
          : appBar != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: appBar!)
              : null,
      drawer: isDesktop ? null : drawer,
      backgroundColor: backgroundColor,
      body: ResponsiveLayout(
        mobileBody: body,
        desktopBody: Row(
          children: [
            const AppDrawer(),
            Expanded(
              child: Column(
                children: [
                  appBar ?? const SizedBox.shrink(),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Expanded(
                    child: body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
