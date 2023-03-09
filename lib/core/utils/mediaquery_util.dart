import 'package:flutter/widgets.dart';
import 'package:nota/core/constants/breakpoints.dart';

class MediaQueryUtil {
  MediaQueryUtil(this.context) : mediaQuery = MediaQuery.of(context);
  final BuildContext context;
  final MediaQueryData mediaQuery;

  Size get size => mediaQuery.size;

  double get width => mediaQuery.size.width;

  double get hight => mediaQuery.size.height;

  bool isMobile() => mediaQuery.size.width <= kMobileBreakpoint;

  bool isTablet() =>
      mediaQuery.size.width > kMobileBreakpoint &&
      mediaQuery.size.width <= kTabletBreakpoint;

  bool isDesktop() => mediaQuery.size.width > kTabletBreakpoint;
}
