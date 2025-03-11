import 'package:aquaflow/presentation/staff/editstaffprofile.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:aquaflow/services/staff/staffviewprofileapi.dart';
import 'package:flutter/material.dart';

class ProfileStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003D99),
        title: Text(
          'AQUA FLOW',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification logic
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                                       radius: 30,                  backgroundImage: NetworkImage(baseUrl+staffPROFILEDATA?['Profile']),

                  backgroundColor: Colors.blue[200],
                  // child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                '${staffPROFILEDATA?['First_name'] ?? ''} ${staffPROFILEDATA?['Mid_name'] ?? ''} ${staffPROFILEDATA?['Last_name'] ?? ''}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),
              Text(
                staffPROFILEDATA!['Phone_no'].toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              // Text(
              //   PROFILEDATA!['Phone_no'],
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.black54,
              //   ),
              // ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Editprofilestaff(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'EDIT PROFILE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
