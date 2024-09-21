import 'package:bu_buds/widgets/list_view_tile.dart';
import 'package:flutter/material.dart';

class CourseScreenView extends StatelessWidget {
  const CourseScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomListViewItem> courseItems = [
      const CustomListViewItem(
        title: 'How to make your design more artful & lyrical',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: NetworkImage(
            'https://example.com/image1.jpg'), // Replace with your image URL
      ),
      const CustomListViewItem(
        title: 'How to make your paper more powerful and high value',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: NetworkImage(
            'https://example.com/image2.jpg'), // Replace with your image URL
      ),
      const CustomListViewItem(
        title: 'How to prepare your documentation assignment',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: NetworkImage(
            'https://example.com/image3.jpg'), // Replace with your image URL
      ),
      // Add more items as needed
    ];
    var listViewNames = ['All', 'Matemathics', 'Biology', 'English'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Course',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[700]),
              child: Column(
                children: [
                  const Text(
                      'Upgrade you skill and get \nyour certified Courses'),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Go to my courses'))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text('View All'))
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listViewNames.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Text(listViewNames[index]),
                );
              },
            ),
            ListView.separated(
              itemCount: courseItems.length,
              itemBuilder: (context, index) => courseItems[index],
              separatorBuilder: (context, index) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
