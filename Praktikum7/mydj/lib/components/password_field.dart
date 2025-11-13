import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final void Function(String value)? onChanged;

  const PasswordField({super.key, this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  void _toggleVisibilityIconButton() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _toggleVisibilityIconButton,
        ),
      ),
    );
  }
}

