// import 'package:aquaflow/services/user/applicationapi.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class applicationforms extends StatefulWidget {
//   final name;
//   final panjayath;
//   final father;
//   final address;
//   final phone;
//   final family;
//   final adhar;
//   final rationcard;
//   final nighbour;
//   final caste;
//   final XFile? certificateimage;
//   final XFile? adharimage;
//   final XFile? rationcardimage;

//   applicationforms(
//       {super.key,
//       required this.name,
//       required this.panjayath,
//       required this.father,
//       required this.address,
//       required this.phone,
//       required this.family,
//       required this.adhar,
//       required this.rationcard,
//       required this.nighbour,
//       required this.caste,
//       this.certificateimage,
//       this.adharimage,
//       this.rationcardimage});

//   @override
//   _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
// }

// class _ApplicationFormScreenState extends State<applicationforms> {
//   bool isAgreed = false;
//   final TextEditingController _dateController = TextEditingController();
//   TextEditingController _placeController = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         _dateController.text = "${picked.day}-${picked.month}-${picked.year}";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("AQUA FLOW", style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.blue[900],
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.notifications),
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
//                         backgroundColor: Colors.green,
//                         child: Text(
//                           '${index + 1}',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Form Content
//                   Text(
//                     "STATEMENT OF TRUTH",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "Please Inform That I Currently Do Not Have Adequate Drinking Water Source And Would Like To Get Drinking Water Connection",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: isAgreed,
//                         onChanged: (value) {
//                           setState(() {
//                             isAgreed = value!;
//                           });
//                         },
//                       ),
//                       Text("Agree"),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   // Date and Place Input
//                   TextFormField(
//                     controller: _dateController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       labelText: "Date",
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.calendar_today),
//                     ),
//                     onTap: () => _selectDate(context),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "Place",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Submit Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue),
//                         child: Text("BACK"),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (isAgreed) {
//                             // Perform submit action
//                             // ScaffoldMessenger.of(context).showSnackBar(
//                             //   SnackBar(
//                             //     content: Text("Form Submitted!"),
//                             //   ),
//                             // );

//                             submitApplication(
//                               user: widget.name,
//                               panchayathName: widget.panjayath,
//                               fatherName: widget.father,
//                               address: widget.address,
//                               phoneNo: widget.phone,
//                               familyMembers: widget.family,
//                               adharNo: widget.adhar,
//                               rationCard: widget.rationcard,
//                               neighbourConsumerNo: widget.nighbour,
//                               cast: widget.caste, 
//                               aadhaarPhotoPath: widget.adharimage!.path,
//                               rationCardPhotoPath: widget.rationcardimage!.path,
//                               ownershipCertificatePhotoPath: widget.certificateimage!.path,
                              
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                     "Please agree to the terms to submit."),
//                               ),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue),
//                         child: Text("SUBMIT"),
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
// }


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class applicationforms extends StatefulWidget {
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
  final XFile? certificateimage;
  final XFile? adharimage;
  final XFile? rationcardimage;

  applicationforms({
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
    this.certificateimage,
    this.adharimage,
    this.rationcardimage, XFile? certificateImage, XFile? adharImage, XFile? rationCardImage,
  });

  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<applicationforms> {
  bool isAgreed = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  bool _isFormValid() {
    return isAgreed &&
        _dateController.text.isNotEmpty &&
        _placeController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AQUA FLOW", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "STATEMENT OF TRUTH",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Please Inform That I Currently Do Not Have Adequate Drinking Water Source And Would Like To Get Drinking Water Connection",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value!;
                      });
                    },
                  ),
                  Text("Agree"),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _placeController,
                decoration: InputDecoration(
                  labelText: "Place",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("BACK"),
                  ),
                  ElevatedButton(
                    onPressed: (
                      
                    ) {
                      if (_isFormValid()) {
                        // Perform submit action here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Form Submitted Successfully!")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields and agree to the terms."),
                          ),
                        );
                      }
                    },
                    child: Text("SUBMIT"),
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
