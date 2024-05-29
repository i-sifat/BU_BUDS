// https://www.youtube.com/watch?v=jyEoMHcjdD4
// https://www.youtube.com/watch?v=UAc9aDtQVGA

import 'package:bu_buds/widgets/buttons.dart';
import 'package:bu_buds/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class SignUpDetails extends StatelessWidget {
  const SignUpDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Name"),
          SizedBox(
            width: 330,
            height: 50,
            child: ReusableTextField(
              controller: TextEditingController(),
              hintText: "Your Name",
              labelText: "Your Name",
              borderColor: Colors.red,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Email"),
          SizedBox(
            width: 330,
            height: 50,
            child: ReusableTextField(
              controller: TextEditingController(),
              hintText: "study@email.com",
              labelText: "study@email.com",
              borderColor: Colors.red,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Password"),
          SizedBox(
            width: 330,
            height: 50,
            child: ReusableTextField(
              controller: TextEditingController(),
              hintText: "Your Password",
              labelText: "Your Password",
              borderColor: Colors.red,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Phone Number"),
          SizedBox(
            width: 330,
            height: 50,
            child: ReusableTextField(
              controller: TextEditingController(),
              hintText: "Phone Number",
              labelText: "+880 17 1514",
              borderColor: Colors.red,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Checkbox(
                      onChanged: (value) {},
                      value: true, // Set a default checked state (optional)
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    "I agree with the terms and conditions \nand also the protection of my personal data \non this application",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 180,
          ),
          AppButton(
            text: "Sign Up",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    AppButton(
                        width: 300,
                        text: "Accept",
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                  content: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 150,
                            width: 120,
                            child: Image.asset('assets/alerticon.png')),
                        const Text(
                          "Account information \nis correct?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fames velit ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            width: 350,
            height: 50,
          )
        ],
      ),
    );
  }
}




// Container(
//                       height: 40,
//                       child:const Column(children: [Text("Account information \nis correct?"),
//                         Text(
//                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fames velit ")],)  [
                        
//                       ],
//                     )