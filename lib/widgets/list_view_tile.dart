// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;

  const CustomListViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: image,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
