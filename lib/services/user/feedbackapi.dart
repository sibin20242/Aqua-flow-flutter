import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitFeedback({
  required String user,
  required String consumerNo,
  required String complaintNo,
 
}) async {
  try {
    FormData data = FormData.fromMap({
      "USER": user,
      "Consumer_no": consumerNo,
      "Complaint_no": complaintNo,
      
    });

    final response = await _dio.post('$baseUrl/feedback', data: data);

    if (response.statusCode == 200) { // Adjust status code based on your API
      print('Feedback submitted successfully!');
      return true;
    } else {
      print('Failed to submit feedback with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Feedback API Error: $e');
    return false;
  }
}
