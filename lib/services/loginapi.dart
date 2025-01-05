
import 'package:aquaflow/presentation/staff/home.dart';
import 'package:aquaflow/presentation/user/home.dart';
import 'package:aquaflow/services/user/viewprofileapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();

// Variables to store login details
String? loginId;
String? userType;

// Base URL for the API (correct the format of the IP address)
String baseUrl = 'http://192.168.1.13:5000'; // Replace with the actual IP and port

// Login function
Future<bool> loginfun(String email, String password,context) async {
  try {
    // API endpoint
    final String endpoint = '$baseUrl/Loginapi'; // Adjust endpoint as necessary

    // Data to send in the POST request
    final data = {
      "email": email,
      "password": password,
    };

    // Sending POST request
    final response = await _dio.post(endpoint, data: data);
     print(response.data);
  print(response.data['status']);
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      // Parse response data
      final responseData = response.data;
    
      // Extract and store login details if available
      loginId = responseData['login_id'].toString();
      userType = responseData['user_type'];

      
     
      if (userType=='User') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctxt)=>HomeScreen1()));
         await    fetchUserProfile();
         
      }
      else if(userType=='Staff'){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctxt)=>HomeScreen2()));
                

      }
      else{
snackbarwiidget(context, 'login failed');
      }

      // print('Login successfulll: LoginId: $loginId, UserType: $userType');
      return true;
    } else {
      snackbarwiidget(context, 'login failed');
      print('Login failed with status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    snackbarwiidget(context, 'login failed');
    print('Login Error: $e');
    return false;
  }
}


void snackbarwiidget(context,data){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
}