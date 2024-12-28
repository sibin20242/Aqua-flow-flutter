import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> updateReport({
  required String staff,
  required String consumerNo,
  required String complaintNo,
  required String photoPath,  // Path to the photo that needs to be uploaded
}) async {
  try {
    FormData data = FormData.fromMap({
      "STAFF": staff,
      "Consumer_no": consumerNo,
      "Complaint_no": complaintNo,
      "Upload_photo": await MultipartFile.fromFile(photoPath, filename: 'upload_photo.jpg'),
    });

    final response = await _dio.post('$baseUrl/updatereport', data: data);

    if (response.statusCode == 200) { // Adjust status code based on your API
      print('Report updated successfully!');
      return true;
    } else {
      print('Failed to update report with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Update Report API Error: $e');
    return false;
  }
}
