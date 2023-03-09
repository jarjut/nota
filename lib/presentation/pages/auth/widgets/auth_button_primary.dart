import 'package:flutter/material.dart';

class AuthButtonPrimary extends StatelessWidget {
  const AuthButtonPrimary({
    super.key,
    required this.onPressed,
    this.label = 'BUTTON',
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF323040),
                strokeWidth: 3,
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
