import 'package:flutter/material.dart';
import 'package:nota/core/gen/assets.gen.dart';

class AuthWrapperTablet extends StatelessWidget {
  const AuthWrapperTablet({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Color(0xFF24232F),
          ),
        ),
        Positioned.fill(
          left: size.width * 0.4,
          child: ClipPath(
            clipper: AuthBackgroundClipper(),
            child: const ColoredBox(
              color: Colors.amber,
            ),
          ),
        ),
        Align(
          child: SizedBox(
            height: 500,
            width: 700,
            child: Card(
              color: const Color(0xFF323040),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: ClipPath(
                      clipper: AuthTabletLoginClipper(),
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          image: DecorationImage(
                            image:
                                Assets.images.deskIllustrationFilled.provider(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 24, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          child,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(size.width / 8, size.height / 2, 0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class AuthTabletLoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final cp1 = Offset(size.width - size.height * 0.025, size.height * 0.1);
    final p1 = Offset(size.width - size.height * 0.08, size.height * 0.175);
    final cp2 = Offset(size.width - size.height * 0.2, size.height * 0.3);
    final p2 = Offset(size.width - size.height * 0.125, size.height * 0.5);
    final cp3 = Offset(size.width - size.height * 0.025, size.height * 0.7);
    final p3 = Offset(size.width - size.height * 0.15, size.height * 0.9);
    final cp4 = Offset(size.width - size.height * 0.2, size.height * 0.975);
    final p4 = Offset(size.width - size.height * 0.3, size.height);
    path
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(cp1.dx, cp1.dy, p1.dx, p1.dy)
      ..quadraticBezierTo(cp2.dx, cp2.dy, p2.dx, p2.dy)
      ..quadraticBezierTo(cp3.dx, cp3.dy, p3.dx, p3.dy)
      ..quadraticBezierTo(cp4.dx, cp4.dy, p4.dx, p4.dy)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
