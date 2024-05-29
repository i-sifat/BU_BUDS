import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText; // Text for the label
  final String hintText; // Hint text displayed when empty (optional)
  final TextEditingController controller; // Text editing controller
  final TextInputType
      keyboardType; // Input type (e.g., TextInputType.text, TextInputType.number)
  final Color borderColor; // Color of the text field border

  const ReusableTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor, width: 2.0), // Thicker border on focus
        ),
      ),
    );
  }
}
