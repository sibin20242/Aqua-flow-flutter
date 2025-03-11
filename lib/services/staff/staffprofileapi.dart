import 'dart:io';
import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();

Future<bool> createOrUpdateStaffProfile({
  required String firstName,
  required String midName,
  required String lastName,
  required String mail,
  required String pincode,
  required String address,
  required String phoneNo,
  File? profileImage, // 👈 Add this to accept the image file
  required BuildContext context,
}) async {
  try {
    FormData formData = FormData.fromMap({
      "First_name": firstName,
      "Mid_name": midName,
      "Last_name": lastName,
      "Mail": mail,
      "Pincode": pincode,
      "Address": address,
      "Phone_no": phoneNo,
      if (profileImage != null)
        "Profile": await MultipartFile.fromFile(
          profileImage.path,
          filename: "profile.jpg", // or use path.basename(profileImage.path)
        ),
    });

    final response = await _dio.post(
      '$baseUrl/UpdateProfile/$loginId',
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
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
