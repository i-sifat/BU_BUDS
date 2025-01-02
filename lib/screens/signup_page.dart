import 'package:bubuds/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import '../utils/validators.dart';
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && _obscurePassword,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      label: "Password",
      controller: _passwordController,
      validator: Validators.validatePassword,
      isPassword: true,
    );
  }

  Widget _buildPhoneField() {
    return _buildTextField(
      label: "Phone Number",
      controller: _phoneController,
      validator: Validators.validatePhone,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildTermsCheckbox() {
    return CheckboxListTile(
      title: const Text("I accept the terms and conditions"),
      value: _termsAccepted,
      onChanged: (bool? value) {
        setState(() {
          _termsAccepted = value ?? false;
        });
      },
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: _navigateToChoosingSubject,
      child: const Text("Sign Up"),
    );
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
                  keyboardType: TextInputType.emailAddress,
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
}
