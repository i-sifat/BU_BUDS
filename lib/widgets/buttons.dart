// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final Function onPressed;
  final double? height;
  final double? width;
  final bool isCircular;

  const AppButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.bgColor = Colors.red,
    required this.onPressed,
    this.height,
    this.width,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: isCircular
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
          minimumSize: Size(width ?? 150, height ?? 45)),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
