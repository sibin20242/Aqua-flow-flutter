import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitAssignedWork({
  required String user,
  required String area,
  required String work,
}) async {
  try {
    final data = {
      "USER": user,
      "area": area,
      "work": work,
    };

    final response = await _dio.post('$baseUrl/assignedwork', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Assigned work submitted successfully!');
      return true;
    } else {
      print('Assigned work submission failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Assigned Work API Error: $e');
    return false;
  }
}
