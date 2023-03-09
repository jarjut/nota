import 'package:flutter/material.dart';
import 'package:nota/core/gen/assets.gen.dart';

class AuthWrapperMobile extends StatelessWidget {
  const AuthWrapperMobile({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: AuthMobileLoginClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.deskIllustrationFilled.provider(),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: child,
          ),
        ],
      ),
    );
  }
}

class AuthMobileLoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final deep = size.width / 8;
    path
      ..lineTo(0, size.height - deep)
      ..quadraticBezierTo(
        size.width / 3,
        size.height - (deep * 2),
        size.width / 2,
        size.height - deep,
      )
      ..quadraticBezierTo(
        size.width - size.width / 3,
        size.height,
        size.width,
        size.height - deep,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
