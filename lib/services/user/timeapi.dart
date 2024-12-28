import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> createTimeSchedule({
  required String date,
  required String time,
}) async {
  try {
    // Data to be sent in the POST request
    final data = {
      "Date": date,
      "Time": time,
    };

    // Sending POST request
    final response = await _dio.post('$baseUrl/schedule', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Time schedule created successfully!');
      return true;
    } else {
      print('Schedule creation failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Schedule Error: $e');
    return false;
  }
}
