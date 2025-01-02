import 'package:bubuds/widgets/dialogs.dart';
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
  bool _termsAccepted = false;
  bool _obscurePassword = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  void _navigateToChoosingSubject() {
    if (_formKey.currentState!.validate()) {
      if (_termsAccepted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChoosingSubjectView(
              userName: _nameController.text,
              selectedTopics: List.generate(5, (index) => false),
            ),
          ),
        );
      } else {
        DialogUtils.showErrorDialog(
          context,
          "You must accept the terms and conditions",
        );
      }
    }
  }

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
          onPressed: () => Navigator.pop(context),
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
                _buildTextField(
                  label: "Name",
                  controller: _nameController,
                  validator: Validators.validateName,
                ),
                _buildTextField(
                  label: "Email",
                  controller: _emailController,
                  validator: Validators.validateEmail,
                ),
                _buildPasswordField(),
                _buildPhoneField(),
                _buildTermsCheckbox(),
                _buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ... Rest of the widget building methods
}
