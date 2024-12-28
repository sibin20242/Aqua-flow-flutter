import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitUserDetails({
  required String userName,
  required String consumerNo,
  required String phoneNo,
}) async {
  try {
    final data = {
      "User_Name": userName,
      "Consumer_NO": consumerNo,
      "Phone_No": phoneNo,
    };

    final response = await _dio.post('$baseUrl/userdetails', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('User details submitted successfully!');
      return true;
    } else {
      print('User details submission failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('User Details API Error: $e');
    return false;
  }
}
