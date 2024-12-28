import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> createOrUpdateProfile({
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
      "Mail": mail,
      "Pincode": pincode,
      "Address": address,
      "Panchayath_name": panchayathName,
      "Profile": profile,
      "Phone_no": phoneNo,
    };

    final response = await _dio.post('$baseUrl/profile', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Profile created or updated successfully!');
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
