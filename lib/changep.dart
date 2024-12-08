import 'package:flutter/material.dart';



class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AQUA FLOW'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Change Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildPasswordField(
                      controller: _currentPasswordController,
                      label: 'Current Password',
                    ),
                    const SizedBox(height: 12),
                    _buildPasswordField(
                      controller: _newPasswordController,
                      label: 'New Password',
                    ),
                    const SizedBox(height: 12),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle forgot password action
                          },
                          child: const Text(
                            'FORGET PASSWORD?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            // Handle save action
                            final currentPassword = _currentPasswordController.text;
                            final newPassword = _newPasswordController.text;
                            final confirmPassword = _confirmPasswordController.text;

                            if (newPassword == confirmPassword) {
                              print('Password Changed Successfully');
                              // Add logic to save password
                            } else {
                              print('Passwords do not match');
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label.toUpperCase(),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
