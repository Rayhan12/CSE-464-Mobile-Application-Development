import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  
  const PasswordField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);
  
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {


  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            // setState(() {
              _obscureText = (!_obscureText);
              print(_obscureText);
              setState(() {});
            // });
          },
        ),
        border: OutlineInputBorder(),
      ),
      validator: widget.validator,
    );
  }
}