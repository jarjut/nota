import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF22212B),
        hoverColor: const Color(0xFF22212B),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
