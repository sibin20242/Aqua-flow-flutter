import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitApplication({
  required String user,
  required String applicationNo,
  required String status,
  required String panchayathName,
  required String fatherName,
  required String motherName,
  required String address,
  required String phoneNo,
  required int familyMembers,
  required String adharNo,
  required String rationCard,
  required String neighbourConsumerNo,
  required String cast,
  required String aadhaarPhotoPath,
  required String rationCardPhotoPath,
  required String ownershipCertificatePhotoPath,
}) async {
  try {
    FormData data = FormData.fromMap({
      "USER": user,
      "Application_no": applicationNo,
      "Status": status,
      "Panchayath_name": panchayathName,
      "Father_name": fatherName,
      "Mother_name": motherName,
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

    final response = await _dio.post('$baseUrl/application', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Application submitted successfully!');
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
