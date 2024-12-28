import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitComplaint({
  required String user,
  required String complaints,
}) async {
  try {
    final data = {
      "USER": user,
      "Complaints": complaints,
    };

    final response = await _dio.post('$baseUrl/complaint', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Complaint submitted successfully!');
      return true;
    } else {
      print('Complaint submission failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Complaint API Error: $e');
    return false;
  }
}
