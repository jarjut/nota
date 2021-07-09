import 'package:flutter/material.dart';
import 'package:nota/constants/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

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
