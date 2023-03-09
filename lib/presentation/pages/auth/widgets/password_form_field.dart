import 'package:flutter/material.dart';
import 'package:nota/presentation/pages/auth/widgets/auth_text_form_field.dart';

class AuthPasswordFormField extends StatefulWidget {
  const AuthPasswordFormField({
    super.key,
    this.controller,
    this.hintText = 'Password',
    this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<AuthPasswordFormField> createState() => _AuthPasswordFormFieldState();
}

class _AuthPasswordFormFieldState extends State<AuthPasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      obscureText: _obscurePassword,
      hintText: widget.hintText,
      onChanged: widget.onChanged,
      validator: widget.validator,
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
