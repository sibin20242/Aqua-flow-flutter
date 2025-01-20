import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();


Future<bool> submitFeedback({
data,context
 
}) async {
  try {
   

    final response = await _dio.post('$baseUrl/Feedbackapi', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Feedback submitted successfully!');
      Navigator.pop(context);
      snackbarwiidget(context, 'send');
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
