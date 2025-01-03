import 'package:flutter/material.dart';
import '../../utils/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading ?? const BackButton(color: Colors.black),
      title: Text(
        title,
        style: AppTypography.h3.copyWith(color: Colors.black),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
