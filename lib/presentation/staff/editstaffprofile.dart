// import 'package:aquaflow/presentation/user/changep.dart';
// import 'package:aquaflow/services/loginapi.dart';
// import 'package:aquaflow/services/staff/staffprofileapi.dart';
// import 'package:aquaflow/services/staff/staffviewprofileapi.dart';
// import 'package:flutter/material.dart';



// class Editprofilestaff extends StatefulWidget {
//   @override
//   State<Editprofilestaff> createState() => _EditprofilestaffState();
// }

// class _EditprofilestaffState extends State<Editprofilestaff> {
//   TextEditingController fnameController=TextEditingController();

//   TextEditingController snameController=TextEditingController();

//   TextEditingController lnameController=TextEditingController();

//   TextEditingController emailController=TextEditingController();

//   TextEditingController phoneController=TextEditingController();

//   TextEditingController pincodeController=TextEditingController();

//   TextEditingController AddressController=TextEditingController();

//   @override
//   void initState() {
//     fnameController.text=staffPROFILEDATA!['First_name'];
//     snameController.text=staffPROFILEDATA!['Mid_name']; 
//     lnameController.text=staffPROFILEDATA!['Last_name'];  
//     emailController.text=staffPROFILEDATA!['Mail'];  
//     phoneController.text=staffPROFILEDATA!['Phone_no'].toString();
//     pincodeController.text=staffPROFILEDATA!['Pincode'].toString();
//     AddressController.text=staffPROFILEDATA!['Address'];

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AQUA FLOWss'),
//         backgroundColor: Color(0xFF003D99),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Center(
//               child: Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(baseUrl+staffPROFILEDATA!['Profile']),
//                     backgroundColor: Colors.grey[300],
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xFF0073E6),
//                         shape: BoxShape.circle,
//                       ),
//                       padding: EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.upload,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             extField(fnameController,'First Name'),
//             extField(snameController,'Middle Name'),
//             extField(lnameController,'Last Name'),
//             extField(phoneController,'Phone No'),
//             extField(emailController,'E-mail'), 
//             extField(pincodeController,'Pin Code'),
//             extField(AddressController,'Address', maxLines: 3),
  
       
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ChangePasswordPage(),
//                                 ),
//                               );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF003D99),
//                   ),
//                   child: Text('Change Password'),
//                 ),
//                 ElevatedButton(
//                   onPressed: ()async {

//                     await createOrUpdateProfile(firstName:fnameController.text,
//                      midName:snameController.text,
//             lastName:lnameController.text,
//            phoneNo: phoneController.text,
//             mail: emailController.text,
//           pincode:pincodeController.text,
//             address:AddressController.text,context: context
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF0073E6),
//                   ),
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget extField(TextEditingController controller,String label, {int maxLines = 1}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:aquaflow/presentation/user/changep.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:aquaflow/services/staff/staffprofileapi.dart';
import 'package:aquaflow/services/staff/staffviewprofileapi.dart';

class Editprofilestaff extends StatefulWidget {
  @override
  State<Editprofilestaff> createState() => _EditprofilestaffState();
}

class _EditprofilestaffState extends State<Editprofilestaff> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController snameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController AddressController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fnameController.text = staffPROFILEDATA!['First_name'];
    snameController.text = staffPROFILEDATA!['Mid_name'];
    lnameController.text = staffPROFILEDATA!['Last_name'];
    emailController.text = staffPROFILEDATA!['Mail'];
    phoneController.text = staffPROFILEDATA!['Phone_no'].toString();
    pincodeController.text = staffPROFILEDATA!['Pincode'].toString();
    AddressController.text = staffPROFILEDATA!['Address'];
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });

      // await _uploadImage(_pickedImage!);
    }
  }

  // Future<void> _uploadImage(File imageFile) async {
  //   try {
  //     String url = '$baseUrl/StaffProfileUpload/$loginId';
  //     FormData formData = FormData.fromMap({
  //       "image": await MultipartFile.fromFile(imageFile.path, filename: "profile.jpg"),
  //     });

  //     var response = await Dio().post(url, data: formData);
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image uploaded successfully")));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload failed")));
  //     }
  //   } catch (e) {
  //     print("Upload error: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload error")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final profileImageUrl = baseUrl + staffPROFILEDATA!['Profile'];

    return Scaffold(
      appBar: AppBar(
        title: Text('AQUA FLOW'),
        backgroundColor: Color(0xFF003D99),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _pickedImage != null
                        ? FileImage(_pickedImage!)
                        : NetworkImage(profileImageUrl) as ImageProvider,
                    backgroundColor: Colors.grey[300],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0073E6),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.upload, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            extField(fnameController, 'First Name'),
            extField(snameController, 'Middle Name'),
            extField(lnameController, 'Last Name'),
            extField(phoneController, 'Phone No'),
            extField(emailController, 'E-mail'),
            extField(pincodeController, 'Pin Code'),
            extField(AddressController, 'Address', maxLines: 3),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangePasswordPage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF003D99)),
                  child: Text('Change Password'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await createOrUpdateStaffProfile(
                      firstName: fnameController.text,
                      midName: snameController.text,
                      lastName: lnameController.text,
                      phoneNo: phoneController.text,
                      mail: emailController.text,
                      pincode: pincodeController.text,
                      address: AddressController.text,
                      profileImage: _pickedImage,
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0073E6)),
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget extField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
