//   final bool value;
// bool _isChecked = false;
//   // final ValueChanged<bool> onChanged;

//     required this.value,

//   });
//   final bool _isChecked = false;
//   @override
//   State<CircularCheckboxListTile> createState() =>
//       _CircularCheckboxListTileState();

//       value: widget.value,
//       onChanged: (bool? newValue) {
//         setState(() {
//           _isChecked = newValue;
//         });
//       },

//     );
//   }
// }

import 'package:flutter/material.dart';

class CircularCheckboxListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CircularCheckboxListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CircularCheckboxListTile> createState() =>
      _CircularCheckboxListTileState();
}

class _CircularCheckboxListTileState extends State<CircularCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      secondary: Icon(widget.leadingIcon),
      controlAffinity: ListTileControlAffinity.platform,
      value: widget.value, // Use the provided value
      onChanged: widget.onChanged, // Pass the callback function
      checkboxShape: const CircleBorder(),
    );
  }
}
