import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio _dio = Dio();
Map<String, dynamic>? staffPROFILEDATA = {};

Future<Map<String, dynamic>?> fetchStaffProfile() async {
  try {
    // Sending GET request
    final response = await _dio.get('$baseUrl/sProfileapi/$loginId/');

    if (response.statusCode == 200) {
      // Adjust based on your API
      print('Profile fetched successfully!');
      print(response.data);
      final profile = response.data;

      print('Name: ${profile["First_name"]}');
      staffImage.value = profile['Profile'];
      staffPROFILEDATA = profile;
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

ValueNotifier<String?> staffImage = ValueNotifier(null);