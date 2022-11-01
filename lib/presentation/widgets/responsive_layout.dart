import 'package:flutter/material.dart';
import 'package:nota/core/constants/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > kDesktopBreakpoint && desktopBody != null) {
          return desktopBody!;
        } else if (constraints.maxWidth > kTabletBreakpoint &&
            tabletBody != null) {
          return tabletBody!;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
