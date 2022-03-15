import 'package:flutter/material.dart';

class AuthWrapperMobile extends StatelessWidget {
  final Widget child;
  const AuthWrapperMobile({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: AuthMobileLoginClipper(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/desk_illustration_filled.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
    path.lineTo(0, size.height - deep);
    path.quadraticBezierTo(size.width / 3, size.height - (deep * 2), size.width / 2, size.height - deep);
    path.quadraticBezierTo(size.width - size.width / 3, size.height, size.width, size.height - deep);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
