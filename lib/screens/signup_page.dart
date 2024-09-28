import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'onboarding_screen/choosing_subject.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({super.key});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController =
      PageController(); // To collect form data

  bool _termsAccepted = false; // Checkbox state
  bool _obscurePassword = true;

  final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail|yahoo)\.com$';
  final String _namePattern = r'^[a-zA-Z ]+$';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    hintText: "Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    if (!RegExp(_namePattern).hasMatch(value)) {
                      return 'Name can only contain alphabets';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email field
                const Text("Email", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    hintText: "study@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!RegExp(_emailPattern).hasMatch(value)) {
                      return 'Enter a valid Gmail, Hotmail, or Yahoo email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password field
                const Text("Password", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    hintText: "Your Password",
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Phone Number field
                const Text("Phone Number", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("+880"),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade50,
                          hintText: "1875263157",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number cannot be empty';
                          }
                          if (value.length != 10 ||
                              !value.startsWith('1875263157')) {
                            return 'Phone number must be exactly "1875263157" with the correct length';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Terms and Conditions Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "I agree with the ",
                          style: const TextStyle(fontSize: 14),
                          children: [
                            WidgetSpan(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(30, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: () {
                                  _showTermsDialog(context);
                                },
                                child: const Text(
                                  "terms and conditions",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                            const TextSpan(
                                text:
                                    " and the protection of my personal data."),
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
                      if (_formKey.currentState!.validate()) {
                        if (_termsAccepted) {
                          // Ensure that PageView is built before using PageController
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          });

                          // Navigate to ChoosingSubjectView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChoosingSubjectView(),
                            ),
                          );
                        } else {
                          _showErrorDialog(context,
                              "You must accept the terms and conditions");
                        }
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Terms and Conditions"),
        content: const SizedBox(
          height: 300, // Make the dialog scrollable
          child: SingleChildScrollView(
            child: Text(
              '''
1. User Agreement: By downloading and using this app, you agree to be bound by these terms and conditions.

2. Account Creation and Usage: You must be a registered student or faculty member of the university to create an account. You are responsible for maintaining the confidentiality of your account credentials. You agree to use the app in accordance with all applicable laws and regulations.

3. Content: The app may contain content provided by the university, students, or faculty members. You may not use the app to upload, distribute, or transmit any content that is illegal, harmful, threatening, abusive, harassing, defamatory, obscene, or otherwise objectionable. The university reserves the right to remove any content that violates these terms and conditions.

4. Intellectual Property: The app, its content, and all related intellectual property rights are owned by the university. You may not reproduce, modify, distribute, or otherwise use the app or its content for any commercial purpose without the prior written consent of the university.

5. Privacy: The university is committed to protecting your privacy. Please refer to our privacy policy for more information.

6. Disclaimer: The app is provided on an "as is" basis without warranties of any kind. The university does not guarantee the accuracy, completeness, or reliability of the content provided through the app.
The university shall not be liable for any damages arising from the use of or inability to use the app.

7. Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of Bangladesh.

8. Amendments: The university reserves the right to modify these terms and conditions at any time. Any changes will be effective upon posting on the app. Your continued use of the app after the posting of any changes constitutes your acceptance of those changes.
''',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
