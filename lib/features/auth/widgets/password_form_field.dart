import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  PasswordFormField({
    Key? key,
    this.controller,
    this.labelText = 'Password',
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: _obscurePassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
    );
  }
}
