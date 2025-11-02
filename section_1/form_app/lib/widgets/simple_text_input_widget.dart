import 'package:flutter/material.dart';

class SimpleTextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String lable;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? Function(String? value)? validate;


  const SimpleTextInputWidget({super.key, required this.controller , required this.lable, this.validate ,this.textInputType, this.maxLines});

  @override
  State<SimpleTextInputWidget> createState() => _SimpleTextInputWidgetState();
}

class _SimpleTextInputWidgetState extends State<SimpleTextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        labelText: widget.lable,
        prefixIcon: Icon(Icons.person),
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
      ),

      onChanged: (String? value){
        print("${widget.lable} : $value");
      },

      validator: widget.validate,

    );
  }
}
