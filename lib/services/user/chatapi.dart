import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();



  Future<bool> sendMessage({
    required int senderId,
    required int receiverId,
    required String message,
  }) async {
    try {
      final data = {
      
        "message": message,
      };

      final response = await _dio.post('$baseUrl/chat/$senderId/$receiverId', data: data);

      if (response.statusCode == 200) {
        print('Message sent successfully!');
        return true;
      } else {
        print('Failed to send message with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Send Message Error: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>?> fetchMessages({
    required int senderId,
    required int receiverId,
  }) async {
    try {
      final response = await _dio.get('$baseUrl/chat/messages', queryParameters: {
        "senderId": senderId,
        "receiverId": receiverId,
      });

      if (response.statusCode == 200) {
        print('Messages fetched successfully!');
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        print('Failed to fetch messages with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Fetch Messages Error: $e');
      return null;
    }
  }

