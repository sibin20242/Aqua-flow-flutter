import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();



  Future<bool> sendMessage({
    required  senderId,
    required  receiverId,
    required String message,
  }) async {
    try {
      final data = {
      
        "message": message,
      };

      final response = await _dio.post('$baseUrl/chat/$senderId/$receiverId', data: data);
print(response.data);
      if (response.statusCode == 201) {
       
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
    required  senderId,
    required  receiverId,
  }) async {
    try {
      final response = await _dio.get('$baseUrl/chat/$senderId/$receiverId', queryParameters: {
        "message": senderId,
        
      });
print(response.data);
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

