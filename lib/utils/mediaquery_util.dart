import 'package:flutter/widgets.dart';
import 'package:nota/constants/breakpoints.dart';

class MediaQueryUtil {
  final BuildContext context;
  final MediaQueryData mediaQuery;

  MediaQueryUtil(this.context) : mediaQuery = MediaQuery.of(context);

  bool isDesktop() => mediaQuery.size.width > kDesktopBreakpoint;

  bool isTablet() => mediaQuery.size.width > kTabletBreakpoint;
}
