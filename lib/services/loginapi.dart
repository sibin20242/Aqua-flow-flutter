import 'dart:convert';
import 'package:dio/dio.dart';

Dio _dio = Dio();

// Variables to store login details
String? loginId;
String? userType;

// Base URL for the API (correct the format of the IP address)
String baseUrl = 'http://192.168.1.13:5000'; // Replace with the actual IP and port

// Login function
Future<bool> loginfun(String email, String password) async {
  try {
    // API endpoint
    final String endpoint = '$baseUrl/login'; // Adjust endpoint as necessary

    // Data to send in the POST request
    final data = {
      "email": email,
      "password": password,
    };

    // Sending POST request
    final response = await _dio.post(endpoint, data: data);

    if (response.statusCode == 200) {
      // Parse response data
      final responseData = response.data;

      // Extract and store login details if available
      loginId = responseData['loginId'];
      userType = responseData['userType'];

      print('Login successful: LoginId: $loginId, UserType: $userType');
      return true;
    } else {
      print('Login failed with status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Login Error: $e');
    return false;
  }
}
