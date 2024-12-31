import 'package:bubuds/widgets/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDetailSheet extends StatelessWidget {
  final MenuItem item;

  const MenuDetailSheet({
    super.key,
    required this.item,
  });

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: item.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              item.icon,
              size: 48,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (item.subItems != null)
            Expanded(
              child: ListView.builder(
                itemCount: item.subItems!.length,
                itemBuilder: (context, index) {
                  final subItem = item.subItems![index];
                  return ListTile(
                    title: Text(subItem.title),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      if (subItem.link != null) {
                        Navigator.pop(context);
                        _launchURL(subItem.link!);
                      } else if (subItem.onTap != null) {
                        Navigator.pop(context);
                        subItem.onTap!();
                      }
                    },
                  );
                },
              ),
            )
          else if (item.externalLink != null)
            ElevatedButton(
              onPressed: () => _launchURL(item.externalLink!),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Open Link'),
            ),
        ],
      ),
    );
  }
}
