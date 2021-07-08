import 'package:flutter/material.dart';
import 'package:nota/features/auth/widgets/auth_text_form_field.dart';

class AuthPasswordFormField extends StatefulWidget {
  AuthPasswordFormField({
    Key? key,
    this.controller,
    this.hintText = 'Password',
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;

  @override
  _AuthPasswordFormFieldState createState() => _AuthPasswordFormFieldState();
}

class _AuthPasswordFormFieldState extends State<AuthPasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      hintText: widget.hintText,
      suffixIcon: IconButton(
        color: Colors.white38,
        icon: _obscurePassword
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
      ),
    );
  }
}
