import 'package:flutter/material.dart';
import 'package:nota/core/gen/assets.gen.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.onPressed,
    this.height = 40.0,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final double height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xFF4285F4),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(4),
              child: Assets.icons.iconGoogle.image(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Text(
                        'Sign in With Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
