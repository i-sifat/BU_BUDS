import 'package:bu_buds/widgets/buttons.dart';
import 'package:bu_buds/widgets/text_fields.dart';

import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.arrow_back), Text("Skip")],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create your profile",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Provide your profile picture and display your \nname to make easy delivery",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset('assets/addphoto.png'),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: ReusableTextField(
                labelText: "Your Name",
                hintText: "Your Name",
                controller: TextEditingController()),
          ),
          const SizedBox(height: 15),
          AppButton(
            text: "Continue",
            onPressed: () {},
            width: 350,
          )
        ],
      ),
    );
  }
}
