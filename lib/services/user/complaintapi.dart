import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();



Future<bool> submitComplaint({
  required data
}) async {
  try {
 

    final response = await _dio.post('$baseUrl/ComplaintRegapi', data: data);

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
