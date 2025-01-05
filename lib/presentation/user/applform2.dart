import 'package:aquaflow/presentation/user/applform3.dart';
import 'package:flutter/material.dart';

class ApplicationFormStep2 extends StatelessWidget {
  final String name;
  final String panjayath;
  final String father;
  final String address;
  final String phone;

  ApplicationFormStep2({
    super.key,
    required this.name,
    required this.panjayath,
    required this.father,
    required this.address,
    required this.phone,
  });

  final TextEditingController _familymembers = TextEditingController();
  final TextEditingController _aadhaar = TextEditingController();
  final TextEditingController _rationcard = TextEditingController();
  final TextEditingController _neighbour = TextEditingController();
  final TextEditingController _cast = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "AQUA FLOW",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepIndicator(isActive: true),
                  StepIndicator(isActive: true),
                  StepIndicator(),
                  StepIndicator(),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _familymembers,
                decoration: const InputDecoration(
                  labelText: 'NUMBER OF FAMILY MEMBERS',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _aadhaar,
                decoration: const InputDecoration(
                  labelText: 'AADHAAR NO',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value.length != 12 || !RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Enter a valid 12-digit Aadhaar number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _rationcard,
                decoration: const InputDecoration(
                  labelText: 'RATION CARD (BPL/APL)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _neighbour,
                decoration: const InputDecoration(
                  labelText: 'NEIGHBOUR CONSUMPTION NO',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cast,
                decoration: const InputDecoration(
                  labelText: 'BELONGING TO SCHEDULED CASTES/SCHEDULED TRIBES?',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the next screen only if the form is valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadDocumentsScreen(
                              family: _familymembers.text,
                              adhar: _aadhaar.text,
                              rationcard: _rationcard.text,
                              nighbour: _neighbour.text,
                              caste: _cast.text,
                              name: name,
                              address: address,
                              phone: phone,
                              father: father,
                              panjayath: panjayath,
                            ),
                          ),
                        );
                      } else {
                        // Show a message if the form is not valid
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all required fields'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final bool isActive;

  const StepIndicator({this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
