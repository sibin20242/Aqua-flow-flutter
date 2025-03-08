
import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();

  Future<bool> registerUser({
    required String password,
    required String firstName,
    required String midName,
    required String lastName,
    required String area,
    required String mail,
    required String pincode,
    required String address,
    required String panchayathName,
    required String profile,
    required String phoneNo,
  }) async {
    try {
      final data = {
        "First_name": firstName,
        "Mid_name": midName,
        "Last_name": lastName,
        "Area": area,
        'email':mail,
        "username": mail,
        "Pincode": pincode,
        "Address": address,
        "Panchayath_name": panchayathName,
        "Profile": profile,
        "Phone_no": phoneNo,
        "password": password,
      };

      final response = await _dio.post('$baseUrl/userregapi',data: data);

      if (response.statusCode == 201) { // Adjust status code based on your API
        print('User registered successfully!');
        return true;
      } else {
        print('Registration failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Registration Error: $e');
      return false;
    }
  }

