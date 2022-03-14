import 'package:flutter/material.dart';
import 'package:nota/widgets/responsive_layout.dart';

import '../../constants/breakpoints.dart';
import '../../widgets/app_drawer.dart';

class MainWrapper extends StatelessWidget {
  final Widget appBar;

  /// Enable Drawer for mobile screen
  final bool drawer;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

  const MainWrapper({
    Key? key,
    required this.appBar,
    required this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.drawer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > kDesktopBreakpoint;
    const appDrawer = AppDrawer();
    return Scaffold(
      appBar: isDesktop
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: appBar,
            ),
      drawer: isDesktop
          ? null
          : drawer
              ? appDrawer
              : null,
      backgroundColor: backgroundColor,
      body: ResponsiveLayout(
        mobileBody: body,
        desktopBody: Column(
          children: [
            appBar,
            const Divider(
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appDrawer,
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
