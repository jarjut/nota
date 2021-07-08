import 'package:flutter/material.dart';

class AuthButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  const AuthButtonPrimary({
    Key? key,
    required this.onPressed,
    this.label = 'BUTTON',
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
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Color(0xFF323040),
                strokeWidth: 3.0,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                color: Color(0xFF323040),
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
