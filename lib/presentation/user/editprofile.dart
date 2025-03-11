import 'package:aquaflow/presentation/user/changep.dart';
import 'package:aquaflow/services/user/profileapi.dart';
import 'package:aquaflow/services/user/viewprofileapi.dart';
import 'package:flutter/material.dart';



class Editprofile extends StatefulWidget {
  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController fnameController=TextEditingController();

  TextEditingController snameController=TextEditingController();

  TextEditingController lnameController=TextEditingController();

  TextEditingController emailController=TextEditingController();

  TextEditingController phoneController=TextEditingController();

  TextEditingController pincodeController=TextEditingController();

  TextEditingController AddressController=TextEditingController();

  @override
  void initState() {
    fnameController.text=PROFILEDATA!['First_name'];
    snameController.text=PROFILEDATA!['Mid_name']; 
    lnameController.text=PROFILEDATA!['Last_name'];  
    emailController.text=PROFILEDATA!['Mail'];  
    phoneController.text=PROFILEDATA!['Phone_no'].toString();
    pincodeController.text=PROFILEDATA!['Pincode'].toString();
    AddressController.text=PROFILEDATA!['Address'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    backgroundColor: Colors.grey[300],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0073E6),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.upload,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            extField(fnameController,'First Name'),
            extField(snameController,'Middle Name'),
            extField(lnameController,'Last Name'),
            extField(phoneController,'Phone No'),
            extField(emailController,'E-mail'), 
            extField(pincodeController,'Pin Code'),
            extField(AddressController,'Address', maxLines: 3),
  
       
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage(),
                                ),
                              );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003D99),
                  ),
                  child: Text('Change Password'),
                ),
                ElevatedButton(
                  onPressed: ()async {

                    await createOrUpdateProfile(firstName:fnameController.text,
                     midName:snameController.text,
            lastName:lnameController.text,
           phoneNo: phoneController.text,
            mail: emailController.text,
          pincode:pincodeController.text,
            address:AddressController.text,context: context
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0073E6),
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  

  Widget extField(TextEditingController controller,String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}