import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();

// Variables to store user details after signup (if needed)


// Base URL for the API


// Signup function
Future<bool> signupfun(String email, String username, String password, ) async {
  try {
    // Check if passwords match before making the API call
    

    // API endpoint
    final String endpoint = '$baseUrl/signupapi'; // Adjust endpoint as necessary

    // Data to send in the POST request
    final data = {
      "email": email,
      "username": username,
      "password": password,
    };

    // Sending POST request
    final response = await _dio.post(endpoint, data: data);

    if (response.statusCode == 200) {
      // Parse response data
      final responseData = response.data;

      // Extract user details if returned
      // userId = responseData['login_id'];
      // userType = responseData['user_type'];
      print(responseData);
      print('Signup successful');
      return true;
    } else {
      print('Signup failed with status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Signup Error: $e');
    return false;
  }
}
