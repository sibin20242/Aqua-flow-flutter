import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();

Future<bool> createOrUpdateProfile({
  required String firstName,
  required String midName,
  required String lastName,
  required String mail,
  required String pincode,
  required String address,
  context,

  // required String profile,
  required String phoneNo,
}) async {
  try {
    final data = {
      "First_name": firstName,
      "Mid_name": midName,
      "Last_name": lastName,
      "Mail": mail,
      "Pincode": pincode,
      "Address": address,

      // "Profile": profile,
      "Phone_no": phoneNo,
    };

    final response = await _dio.put('$baseUrl/ProfileRegapi/$loginId', data: data);

    if (response.statusCode == 201) {
      // Adjust status code based on your API
      print('Profile created or updated successfully!');
      Navigator.pop(context);
      return true;
    } else {
      print('Profile update failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Profile API Error: $e');
    return false;
  }
}
