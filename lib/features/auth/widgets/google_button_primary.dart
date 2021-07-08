import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  const GoogleButtonPrimary({
    Key? key,
    required this.onPressed,
    this.label = 'Sign in with Google',
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF323040),
                strokeWidth: 3.0,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.google,
                  color: Color(0xFF323040),
                  size: 18.0,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF323040),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }
}
