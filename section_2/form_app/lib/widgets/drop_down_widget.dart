import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {

  final String labelText;
  final TextEditingController controller;
  final List<String> items;

  const DropDownWidget({super.key, required this.labelText, required this.controller, required this.items});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
    
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      
      
      items: widget.items.map((value){
        return DropdownMenuItem<String>(value: value,child: Text(value),);
      }).toList(),



      onChanged: (String? newValue) {
        setState(() {
          widget.controller.text = newValue ?? '';
        });
      },
      
    );
  }
}