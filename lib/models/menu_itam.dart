import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final List<SubMenuItem>? subItems;
  final String? externalLink;

  const MenuItem({
    required this.title,
    required this.icon,
    this.subItems,
    this.externalLink,
  });
}

class SubMenuItem {
  final String title;
  final String? link;
  final Function()? onTap;

  const SubMenuItem({
    required this.title,
    this.link,
    this.onTap,
  });
}
