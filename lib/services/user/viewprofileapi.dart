import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();
 Map<String, dynamic>?PROFILEDATA={};

Future<Map<String, dynamic>?> fetchUserProfile() async {
  try {
    // Sending GET request
    final response = await _dio.get('$baseUrl/Profileapi/$loginId/');

    if (response.statusCode == 200) { // Adjust based on your API
      print('Profile fetched successfully!');
print(response.data);
      // Extracting fields from the response
      final data = response.data;
      final profile = response.data;

      print('Name: ${profile["First_name"]}');
      print('Consumer Number: ${profile["Mid_name"]}');
      print('ID: ${profile["id"]}');
    PROFILEDATA=profile;
      return profile;
    } else {
      print('Failed to fetch profile with status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Fetch Profile Error: $e');
    return null;
  }
}
