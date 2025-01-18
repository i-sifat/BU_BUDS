import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildListTile('About Us', onTap: () => _showAboutUsDetails(context)),
          _buildListTile('Help'),
          _buildListTile('Term and Condition'),
          _buildListTile('Data Protection'),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  void _showAboutUsDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutUsDetailsScreen(),
      ),
    );
  }
}

class AboutUsDetailsScreen extends StatelessWidget {
  const AboutUsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Study is a Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildBulletPoint(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.'),
            _buildBulletPoint(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.'),
            _buildBulletPoint(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
