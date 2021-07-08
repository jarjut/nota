import 'package:flutter/material.dart';
import 'package:nota/features/auth/widgets/auth_wrapper_mobile.dart';
import 'package:nota/features/auth/widgets/auth_wrapper_tablet.dart';

import '../../constants/breakpoints.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  const AuthWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF323040),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (size.width >= kTabletBreakpoint) {
            return AuthWrapperTablet(child: child);
          } else {
            return AuthWrapperMobile(child: child);
          }
        },
      ),
    );
  }
}
