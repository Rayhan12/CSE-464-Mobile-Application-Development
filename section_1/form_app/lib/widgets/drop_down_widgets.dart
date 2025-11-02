import 'package:flutter/material.dart';

class DropDownWidgets extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String lable;

  const DropDownWidgets({super.key, required this.controller, required this.items, required this.lable});

  @override
  State<DropDownWidgets> createState() => _DropDownWidgetsState();
}

class _DropDownWidgetsState extends State<DropDownWidgets> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      
      decoration: InputDecoration(
        labelText: widget.lable,
        border: OutlineInputBorder(),
      ),
      
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),


      onChanged: (String? newValue) {
        setState(() {
          widget.controller.text = newValue ?? '';
        });
      },

      validator: (value) => value == null ? 'Please select a country' : null,
    );
  }
}
