import 'package:flutter/material.dart';
import 'package:nota/features/auth/wrapper/auth_wrapper_mobile.dart';
import 'package:nota/features/auth/wrapper/auth_wrapper_tablet.dart';
import 'package:nota/widgets/responsive_layout.dart';

class AuthWrapper extends StatelessWidget {
  final Widget body;
  const AuthWrapper({Key? key, required this.body}) : super(key: key);

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
