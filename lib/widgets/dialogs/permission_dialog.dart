// lib/widgets/dialogs/permission_dialog.dart
import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  final String title;
  final String message;

  const PermissionDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Deny'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Allow'),
        ),
      ],
    );
  }
}
