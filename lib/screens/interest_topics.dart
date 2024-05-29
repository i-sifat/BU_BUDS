import 'package:flutter/material.dart';

class UserInterestTopics extends StatelessWidget {
  const UserInterestTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.arrow_back), Text("Skip")],
            ),
          ),
          Text(""),
          Text(""),
          SizedBox(),
          // CheckboxListTile(

          //   title: Text("I'm interested in learning Flutter"),
          //   value: true,
          // )
        ],
      ),
    );
  }
}
