// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadDocumentsScreen extends StatefulWidget {
//   final String name;
//   final String panjayath;
//   final String father;
//   final String address;
//   final String phone;
//   final String family;
//   final String adhar;
//   final String rationcard;
//   final String nighbour;
//   final String caste;

//   const UploadDocumentsScreen({
//     super.key,
//     required this.name,
//     required this.panjayath,
//     required this.father,
//     required this.address,
//     required this.phone,
//     required this.family,
//     required this.adhar,
//     required this.rationcard,
//     required this.nighbour,
//     required this.caste,
//   });

//   @override
//   _UploadDocumentsScreenState createState() => _UploadDocumentsScreenState();
// }

// class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _certificateimage;
//   XFile? _adharimage;
//   XFile? _rationcardimage;

//   Future<void> _pickImage(String type) async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         if (type == 'adhar') {
//           _adharimage = image;
//         } else if (type == 'ration') {
//           _rationcardimage = image;
//         } else {
//           _certificateimage = image;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AQUA FLOW", style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.blue[900],
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.notifications),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   // Step Indicator
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: List.generate(
//                       4,
//                       (index) => CircleAvatar(
//                         backgroundColor: index < 3 ? Colors.green : Colors.grey,
//                         child: Text(
//                           '${index + 1}',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Document Upload Section
//                   _buildUploadSection(
//                     title: "SUBMIT THE OWNERSHIP CERTIFICATE OF THE BUILDING",
//                     type: 'certificate',
//                   ),
//                   const SizedBox(height: 20),
//                   _buildUploadSection(
//                     title: "SUBMIT COPY OF AADHAAR CARD",
//                     type: 'adhar',
//                   ),
//                   const SizedBox(height: 20),
//                   _buildUploadSection(
//                     title: "SUBMIT COPY OF RATION CARD",
//                     type: 'ration',
//                   ),
//                   const SizedBox(height: 20),
//                   // Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                         child: const Text("BACK"),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navigate to the next screen with the uploaded images
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ApplicationForms(
//                                 name: widget.name,
//                                 panjayath: widget.panjayath,
//                                 father: widget.father,
//                                 address: widget.address,
//                                 phone: widget.phone,
//                                 family: widget.family,
//                                 adhar: widget.adhar,
//                                 rationcard: widget.rationcard,
//                                 nighbour: widget.nighbour,
//                                 caste: widget.caste,
//                                 certificateimage: _certificateimage,
//                                 adharimage: _adharimage,
//                                 rationcardimage: _rationcardimage,
//                               ),
//                             ),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Proceeding to Next Step!")),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                         child: const Text("NEXT"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildUploadSection({required String title, required String type}) {
//     XFile? selectedImage;

//     // Determine which image to show based on the type
//     if (type == 'certificate') {
//       selectedImage = _certificateimage;
//     } else if (type == 'adhar') {
//       selectedImage = _adharimage;
//     } else if (type == 'ration') {
//       selectedImage = _rationcardimage;
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         GestureDetector(
//           onTap: () {
//             _pickImage(type);
//           },
//           child: Container(
//             height: 100,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: selectedImage == null
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Icon(Icons.cloud_upload, color: Colors.blue, size: 40),
//                         SizedBox(height: 5),
//                         Text("Upload Photo", style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   )
//                 : ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.file(
//                       File(selectedImage.path),
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ApplicationForms extends StatelessWidget {
//   final String name;
//   final String panjayath;
//   final String father;
//   final String address;
//   final String phone;
//   final String family;
//   final String adhar;
//   final String rationcard;
//   final String nighbour;
//   final String caste;
//   final XFile? certificateimage;
//   final XFile? adharimage;
//   final XFile? rationcardimage;

//   const ApplicationForms({
//     super.key,
//     required this.name,
//     required this.panjayath,
//     required this.father,
//     required this.address,
//     required this.phone,
//     required this.family,
//     required this.adhar,
//     required this.rationcard,
//     required this.nighbour,
//     required this.caste,
//     this.certificateimage,
//     this.adharimage,
//     this.rationcardimage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Application Forms")),
//       body: Center(child: const Text("Next screen content here.")),
//     );
//   }
// }

import 'dart:io';
import 'package:aquaflow/presentation/user/applform4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentsScreen extends StatefulWidget {
  final String name;
  final String panjayath;
  final String father;
  final String address;
  final String phone;
  final String family;
  final String adhar;
  final String rationcard;
  final String nighbour;
  final String caste;

  const UploadDocumentsScreen({
    super.key,
    required this.name,
    required this.panjayath,
    required this.father,
    required this.address,
    required this.phone,
    required this.family,
    required this.adhar,
    required this.rationcard,
    required this.nighbour,
    required this.caste,
  });

  @override
  _UploadDocumentsScreenState createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _certificateImage;
  XFile? _adharImage;
  XFile? _rationCardImage;

  Future<void> _pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (type == 'adhar') {
          _adharImage = image;
        } else if (type == 'ration') {
          _rationCardImage = image;
        } else {
          _certificateImage = image;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AQUA FLOW",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Step Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => CircleAvatar(
                        backgroundColor: index < 3 ? Colors.green : Colors.grey,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Document Upload Section
                  _buildUploadSection(
                    title: "SUBMIT THE OWNERSHIP CERTIFICATE OF THE BUILDING",
                    type: 'certificate',
                  ),
                  const SizedBox(height: 20),
                  _buildUploadSection(
                    title: "SUBMIT COPY OF AADHAAR CARD",
                    type: 'adhar',
                  ),
                  const SizedBox(height: 20),
                  _buildUploadSection(
                    title: "SUBMIT COPY OF RATION CARD",
                    type: 'ration',
                  ),
                  const SizedBox(height: 20),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: const Text("BACK"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_certificateImage == null ||
                              _adharImage == null ||
                              _rationCardImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please upload all required documents."),
                              ),
                            );
                            return;
                          }

                          // Navigate to the next screen with the uploaded images
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => applicationforms(
                                name: widget.name,
                                panjayath: widget.panjayath,
                                father: widget.father,
                                address: widget.address,
                                phone: widget.phone,
                                family: widget.family,
                                adhar: widget.adhar,
                                rationcard: widget.rationcard,
                                nighbour: widget.nighbour,
                                caste: widget.caste,
                                certificateImage: _certificateImage,
                                adharImage: _adharImage,
                                rationCardImage: _rationCardImage,
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Proceeding to Next Step!")),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: const Text("NEXT"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection({required String title, required String type}) {
    XFile? selectedImage;

    // Determine which image to show based on the type
    if (type == 'certificate') {
      selectedImage = _certificateImage;
    } else if (type == 'adhar') {
      selectedImage = _adharImage;
    } else if (type == 'ration') {
      selectedImage = _rationCardImage;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _pickImage(type);
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: selectedImage == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_upload, color: Colors.blue, size: 40),
                        SizedBox(height: 5),
                        Text("Upload Photo", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(selectedImage.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class ApplicationForms extends StatelessWidget {
  final String name;
  final String panjayath;
  final String father;
  final String address;
  final String phone;
  final String family;
  final String adhar;
  final String rationcard;
  final String nighbour;
  final String caste;
  final XFile? certificateImage;
  final XFile? adharImage;
  final XFile? rationCardImage;

  const ApplicationForms({
    super.key,
    required this.name,
    required this.panjayath,
    required this.father,
    required this.address,
    required this.phone,
    required this.family,
    required this.adhar,
    required this.rationcard,
    required this.nighbour,
    required this.caste,
    this.certificateImage,
    this.adharImage,
    this.rationCardImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Forms")),
      body: Center(child: const Text("Next screen content here.")),
    );
  }
}
