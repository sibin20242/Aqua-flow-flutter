// import 'package:aquaflow/services/user/signupapi.dart';
// import 'package:flutter/material.dart';

// class RegistrationForm extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     TextEditingController _emailController = TextEditingController();
//       TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Gradient background
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color.fromARGB(243, 0, 25, 67), Colors.lightBlue],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // App logo or an icon
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundColor: Colors.white,
//                             child: Icon(
//                               Icons.person_add_alt_1,
//                               size: 40,
//                               color: Color.fromARGB(227, 13, 51, 117),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             'Create Your Account',
//                             style: TextStyle(
//                               fontSize: 26,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(227, 13, 51, 117),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'Sign up to get started',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                           TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.email, color: Color.fromARGB(227, 13, 51, 117)),
//                               labelText: 'Email or Mobile',
//                               labelStyle: TextStyle(color: Color.fromARGB(227, 13, 51, 117)),

//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: BorderSide(color: Colors.blueAccent),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email or mobile number';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             controller: _usernameController,
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.person, color: Color.fromARGB(227, 13, 51, 117)),
//                               labelText: 'Full Name',
//                               labelStyle: TextStyle(color: Color.fromARGB(227, 13, 51, 117)),

//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: BorderSide(color: Colors.blueAccent),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your username';
//                               }
//                               return null;
//                             },
//                           ),

//                        SizedBox(height: 20),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.lock, color: Color.fromARGB(227, 13, 51, 117)),
//                               labelText: 'Password',
//                               labelStyle: TextStyle(color: Color.fromARGB(227, 13, 51, 117)),

//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: BorderSide(color: Colors.blueAccent),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(227, 13, 51, 117)),
//                               labelText: 'Confirm Password',
//                               labelStyle: TextStyle(color: Color.fromARGB(227, 13, 51, 117)),

//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: BorderSide(color: Colors.blueAccent),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please confirm your password';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 30),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // ScaffoldMessenger.of(context).showSnackBar(
//                                 //   SnackBar(content: Text('Registration successful')),
//                                 // );

//                                 signupfun(_emailController.text, _usernameController.text, _passwordController.text);
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color.fromARGB(227, 13, 51, 117),
//                               padding: EdgeInsets.symmetric(vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.app_registration, color: Colors.white),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   "Register",
//                                   style: TextStyle(fontSize: 18, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Already have an account? Log in",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 10, 36, 81),
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:aquaflow/services/user/userregapi.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _selectedArea;

  final List<String> _areaList = [
    'Puthuppady',
    'Manalvayal',
    'Kannapankund',
    'Kaithapoyil',
  ];

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(243, 0, 25, 67), Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // App logo or an icon
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person_add_alt_1,
                              size: 40,
                              color: Color.fromARGB(227, 13, 51, 117),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Create Your Account',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(227, 13, 51, 117),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Sign up to get started',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _emailController,
                            decoration: inputDecoration.copyWith(
                              prefixIcon: const Icon(Icons.email,
                                  color: Color.fromARGB(227, 13, 51, 117)),
                              labelText: 'Email or Mobile',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email or mobile number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _usernameController,
                            decoration: inputDecoration.copyWith(
                              prefixIcon: const Icon(Icons.person,
                                  color: Color.fromARGB(227, 13, 51, 117)),
                              labelText: 'Full Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: inputDecoration.copyWith(
                              labelText: 'Select Your Area',
                              prefixIcon: const Icon(Icons.location_on,
                                  color: Color.fromARGB(227, 13, 51, 117)),
                            ),
                            value: _selectedArea,
                            items: _areaList
                                .map((area) => DropdownMenuItem(
                                      value: area,
                                      child: Text(area),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedArea = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select your area';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: inputDecoration.copyWith(
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color.fromARGB(227, 13, 51, 117)),
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: inputDecoration.copyWith(
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Color.fromARGB(227, 13, 51, 117)),
                              labelText: 'Confirm Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log('Registration successful');
                                registerUser(
                                  address: '',
                                  area: _selectedArea!,
                                  firstName: _usernameController.text,
                                  lastName: '',
                                  mail: _emailController.text,
                                  midName: '',
                                  panchayathName: '',
                                  phoneNo: '',
                                  pincode: '',
                                  profile: '',
                                  password: _passwordController.text,
                                );
                                // Add your signup function here
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(227, 13, 51, 117),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.app_registration,
                                    color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 36, 81),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
