import 'package:flutter/material.dart';
//https://pub.dev/packages/calendar_view/example

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Jenny Wilson",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Here is your activity today",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [Icon(Icons.notifications_none_rounded)],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: const Color(0xFFF3F5F8),
              child: Padding(
                padding: const EdgeInsets.all(15),
                // child: GridView.count(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 15,
                //   mainAxisSpacing: 15,

                //what is difference between them....
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio:
                        2, // Adjust this to control the height of children
                  ),
                  children: [
                    SizedBox(
                      height:
                          80, // Adjust this value to increase or decrease the container size
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          80, // Adjust this value to increase or decrease the container size
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          80, // Adjust this value to increase or decrease the container size
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          80, // Adjust this value to increase or decrease the container size
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
