import 'package:flutter/material.dart';

class SimpleInputWidget extends StatefulWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const SimpleInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText ,
    required this.prefixIcon, 
    this.validator,
    this.maxLines,
    this.keyboardType
    });

  @override
  State<SimpleInputWidget> createState() => _SimpleInputWidgetState();
}


class _SimpleInputWidgetState extends State<SimpleInputWidget> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType ?? TextInputType.text, 
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: Icon(widget.prefixIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            validator: widget.validator,




          );
  }
}



