import 'package:flutter/material.dart';
import 'package:nota/presentation/pages/auth/wrapper/auth_wrapper_mobile.dart';
import 'package:nota/presentation/pages/auth/wrapper/auth_wrapper_tablet.dart';
import 'package:nota/presentation/widgets/responsive_layout.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323040),
      body: ResponsiveLayout(
        mobileBody: AuthWrapperMobile(child: body),
        tabletBody: AuthWrapperTablet(child: body),
      ),
    );
  }
}
