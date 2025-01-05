import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();



Future<bool> submitApplication({
  required String user,
  // required String applicationNo,
  // required String status,
  required String panchayathName,
  required String fatherName,
  required String address,
  required String phoneNo,
  required String familyMembers,
  required String adharNo,
  required String rationCard,
  required String neighbourConsumerNo,
  required String cast,
  required String aadhaarPhotoPath,
  required String rationCardPhotoPath,
  required String ownershipCertificatePhotoPath,
  context
}) async {
  try {
    FormData data = FormData.fromMap({
      "USER": user,
      "Panchayath_name": panchayathName,
      "Father_name": fatherName,
      "Address": address,
      "Phone_no": phoneNo,
      "Family_members": familyMembers,
      "Adhar_no": adharNo,
      "Rationcard": rationCard,
      "Neighbourconsumer_no": neighbourConsumerNo,
      "Cast": cast,
      "Aadhaar_photo": await MultipartFile.fromFile(aadhaarPhotoPath, filename: 'aadhaar_photo.jpg'),
      "Rationcard_photo": await MultipartFile.fromFile(rationCardPhotoPath, filename: 'rationcard_photo.jpg'),
      "Ownershipcertificate_photo": await MultipartFile.fromFile(ownershipCertificatePhotoPath, filename: 'ownershipcertificate_photo.jpg'),
    });
    print(data);

    final response = await _dio.post('$baseUrl/AppliRegapi/$loginId', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Application submitted successfully!');
      Navigator.pop(context);
      return true;
    } else {
      print('Application submission failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Application API Error: $e');
    return false;
  }
}
