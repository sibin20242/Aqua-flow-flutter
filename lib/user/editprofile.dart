import 'package:aquaflow/user/changep.dart';
import 'package:flutter/material.dart';



class Editprofile extends StatelessWidget {
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
            buildTextField('First Name'),
            buildTextField('Middle Name'),
            buildTextField('Last Name'),
            buildTextField('Phone No'),
            buildTextField('E-mail'),
            buildTextField('Pin Code'),
            buildTextField('Address', maxLines: 3),
            buildTextField('Panchayath Name'),
            buildTextField('Staff ID'),
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
                  onPressed: () {
                    
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

  Widget buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
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