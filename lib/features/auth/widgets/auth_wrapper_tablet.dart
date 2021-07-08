import 'package:flutter/material.dart';

class AuthWrapperTablet extends StatelessWidget {
  final Widget child;
  const AuthWrapperTablet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: const Color(0xFF24232F),
          ),
        ),
        Positioned.fill(
          left: size.width * 0.4,
          child: ClipPath(
            clipper: AuthBackgroundClipper(),
            child: Container(
              color: Colors.amber,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 500,
            width: 700,
            child: Card(
              color: const Color(0xFF323040),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipPath(
                      clipper: AuthTabletLoginClipper(),
                      child: Container(
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/desk_illustration_filled.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
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
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 8, size.height / 2, 0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class AuthTabletLoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    final cp1 = Offset(size.width - size.height * 0.025, size.height * 0.1);
    final p1 = Offset(size.width - size.height * 0.08, size.height * 0.175);
    path.quadraticBezierTo(cp1.dx, cp1.dy, p1.dx, p1.dy);

    final cp2 = Offset(size.width - size.height * 0.2, size.height * 0.3);
    final p2 = Offset(size.width - size.height * 0.125, size.height * 0.5);
    path.quadraticBezierTo(cp2.dx, cp2.dy, p2.dx, p2.dy);

    final cp3 = Offset(size.width - size.height * 0.025, size.height * 0.7);
    final p3 = Offset(size.width - size.height * 0.15, size.height * 0.9);
    path.quadraticBezierTo(cp3.dx, cp3.dy, p3.dx, p3.dy);

    final cp4 = Offset(size.width - size.height * 0.2, size.height * 0.975);
    final p4 = Offset(size.width - size.height * 0.3, size.height);
    path.quadraticBezierTo(cp4.dx, cp4.dy, p4.dx, p4.dy);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
