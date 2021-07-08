import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF22212B),
        hoverColor: const Color(0xFF22212B),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
