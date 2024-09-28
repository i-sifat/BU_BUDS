import 'package:flutter/material.dart';

class PersonScreenView extends StatelessWidget {
  // List of topics with corresponding icons
  final List<Map<String, IconData>> topics = [
    {'Profile': Icons.person_outline},
    {'Account': Icons.account_balance_wallet_outlined},
    {'Setting': Icons.settings_outlined},
    {'About': Icons.info_outline},
  ];

  PersonScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.circle, color: Colors.red, size: 30),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/addphoto.png'), // Replace with the correct image path
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Marvin McKinney",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey)
                ],
              ),
            ),
            const Divider(color: Colors.grey, thickness: 1),

            // List of options (Profile, Account, etc.)
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  // Extract the topic name and icon from the map
                  String topicName = topics[index].keys.first;
                  IconData icon = topics[index].values.first;

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue[50],
                          child: Icon(icon, color: Colors.blue),
                        ),
                        title: Text(
                          topicName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),

            // Help Section (Red banner)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.headset_mic, color: Colors.white, size: 30),
                    SizedBox(width: 16),
                    Text(
                      "How can we help you?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer Section (Privacy Policy, Terms, Language)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "English",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
