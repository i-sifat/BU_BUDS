import 'package:bu_buds/screens/course/course_details.dart';
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
        image:
            AssetImage('assets/Rectangle2753.png'), // Corrected image provider
      ),
      const CustomListViewItem(
        title: 'How to make your paper more powerful and high value',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image:
            AssetImage('assets/Rectangle2754.png'), // Corrected image provider
      ),
      const CustomListViewItem(
        title: 'How to prepare your documentation assignment',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image:
            AssetImage('assets/Rectangle2755.png'), // Corrected image provider
      ),
    ];

    var listViewNames = ['All', 'Mathematics', 'Biology', 'English'];

    return Scaffold(
      backgroundColor: Colors.white, // Set scaffold color to white
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
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
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[700],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Upgrade your skill and get\nyour certified Courses',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Go to my courses'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listViewNames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 10), // Add space between category items
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey[50],
                      ),
                      child: Text(listViewNames[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15), // Add spacing between rows
            Expanded(
                child: ListView.separated(
              itemCount: courseItems.length,
              itemBuilder: (context, index) {
                final courseItem = courseItems[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CourseDetailsView(),
                      ),
                    );
                  },
                  child: courseItem,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                thickness: 1,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
