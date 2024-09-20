import 'package:flutter/material.dart';


import 'onboarding_screen/choosing_subject.dart';

class SignUpDetails extends StatelessWidget {
  const SignUpDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // To handle keyboard overflow, we use SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              // Name Input Field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50, // Light blue background
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // More rounded corners
                    borderSide: const BorderSide(color: Colors.transparent), // No border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email field
              const Text("Email", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50, // Light blue background
                  hintText: "study@email.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // More rounded corners
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password field
              const Text("Password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: "Your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Phone Number field
              const Text("Phone Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: "+880 17 1514",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Terms and Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    checkColor: Colors.white,
                    activeColor: Colors.blue, // Blue checkbox
                    onChanged: (bool? value) {
                      // Handle checkbox change
                    },
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "I agree with the ",
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "terms and conditions",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: " and also the protection of my personal data on this application",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon inside circular shape with decoration
                            const Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(image: AssetImage('assets/alerticon.png')
                                // Container(
                                //   height: 100,
                                //   width: 100,
                                //   decoration: BoxDecoration(
                                //     color: Colors.red.shade100, // Light red background
                                //     shape: BoxShape.circle,
                                //   ),
                                // ),
                                // Container(
                                //   height: 80,
                                //   width: 80,
                                //   decoration: const BoxDecoration(
                                //     color: Colors.red, // Darker red inside the circle
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: const Icon(
                                //     Icons.verified_rounded, // You can use your asset here
                                //     color: Colors.white,
                                //     size: 40,
                                //   ),
                                // ),
                                )],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Account information \nis correct?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black, // Dark text color
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fames velit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey, // Light grey text
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Accept button with red background
                            SizedBox(
                              width: double.infinity, // Full-width button
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Red background
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12), // Rounded corners
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ChoosingSubjectView(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                    // Display dialog box to confirm account info
                    // showDialog(
                    //   context: context,
                      // builder: (context) => AlertDialog(
                      //   content: const Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       SizedBox(
                      //         height: 150,
                      //         width: 120,
                      //         child: Image(image: AssetImage('assets/alerticon.png')),
                      //       ),
                      //       Text(
                      //         "Account information is correct?",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w800, fontSize: 18),
                      //       ),
                      //       SizedBox(height: 20),
                      //       Text(
                      //         "Please confirm that all the details entered are accurate.",
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ],
                      //   ),
                      //   actions: [
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const HomeScreenView()),
                      //         );
                      //       },
                      //       child: const Text("Accept"),
                      //     )
                      //   ],
                      // ),
                    // );
                  },
                  child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
