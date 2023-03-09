import 'package:flutter/material.dart';
import 'package:nota/core/constants/breakpoints.dart';
import 'package:nota/presentation/widgets/app_drawer.dart';
import 'package:nota/presentation/widgets/responsive_layout.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    super.key,
    required this.appBar,
    required this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.showDrawer = true,
  });
  final Widget appBar;

  /// Enable Drawer for mobile screen
  final bool showDrawer;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

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
          : showDrawer
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
