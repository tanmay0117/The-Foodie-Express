import 'package:flutter/material.dart';

class InputDetails extends StatelessWidget {
  final TextEditingController controller;
  final String labText;
  // final TextInputType keyboardType;

  InputDetails({
    required this.controller,
    required this.labText,
    /*required this.keyboardType*/
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
