import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();



Future<List<Map<String,dynamic>>> viewstatus() async {
  try {
    // Data to be sent in the POST request
   

    // Sending POST request
    final response = await _dio.get('$baseUrl/Statusapi,$loginId',);

    if (response.statusCode == 200) { // Adjust status code based on your API
      print('Time schedule created successfully!');
      print(response.data);
      return List<Map<String,dynamic>>.from(response.data);
    } else {
      print('Schedule creation failed with status: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Schedule Error: $e');
    return [];
  }
}
