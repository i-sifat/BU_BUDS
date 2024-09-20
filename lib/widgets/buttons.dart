// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
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
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgColor,
          shape: widget.isCircular
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
          minimumSize: Size(widget.width ?? 150, widget.height ?? 45)),
      child: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      ),
    );
  }
}
