import 'package:bubuds/screens/department_selection_screen.dart';
import 'package:bubuds/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/validators.dart';

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

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    await prefs.setString('userEmail', _emailController.text);
    await prefs.setString('userPhone', _phoneController.text);
    await prefs.setString('userPassword', _passwordController.text);
  }

  void _navigateToChoosingSubject() async {
    if (_formKey.currentState!.validate()) {
      if (_termsAccepted) {
        await _saveUserData();
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DepartmentSelectionScreen(
                userName: _nameController.text,
              ),
            ),
          );
        }
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
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword && _obscurePassword,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
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
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  label: 'Name',
                  hintText: 'Your name',
                  controller: _nameController,
                  validator: Validators.validateName,
                ),
                _buildTextField(
                  label: 'Email',
                  hintText: 'study@email.com',
                  controller: _emailController,
                  validator: Validators.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  label: 'Password',
                  hintText: 'Your password',
                  controller: _passwordController,
                  validator: Validators.validatePassword,
                  isPassword: true,
                ),
                _buildTextField(
                  label: 'Phone Number',
                  hintText: '0334 xxxx xxxx',
                  controller: _phoneController,
                  validator: Validators.validatePhone,
                  keyboardType: TextInputType.phone,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: Colors.blue,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree with the ',
                          style: const TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: 'terms and conditions',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ' and also the protection of my personal data on this application',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _navigateToChoosingSubject,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31E24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
}
