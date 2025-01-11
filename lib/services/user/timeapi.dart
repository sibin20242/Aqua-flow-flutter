import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();



Future<Map<String,dynamic>> viewTimeSchedule({
  required data
}) async {
  try {
    // Data to be sent in the POST request
   

    // Sending POST request
    final response = await _dio.get('$baseUrl/Timeapi', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Time schedule created successfully!');
      return response.data;
    } else {
      print('Schedule creation failed with status: ${response.statusCode}');
      return {};
    }
  } catch (e) {
    print('Schedule Error: $e');
    return {};
  }
}
