import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> submitMeterReading({
  required String user,
  required String staff,
  required int previousMeterReading,
  required int currentMeterReading,
  required int totalUsage,
  required double fixedCharge,
  required double priorObligation,
  required double advance,
  required double fine,
  required double totalAmount,
}) async {
  try {
    final data = {
      "USER": user,
      "STAFF": staff,
      "Previous_MeterReading": previousMeterReading,
      "Current_MeterReading": currentMeterReading,
      "Total_Usage": totalUsage,
      "Fixed_Charge": fixedCharge,
      "Prior_Obligation": priorObligation,
      "Advance": advance,
      "Fine": fine,
      "Total_Amount": totalAmount,
    };

    final response = await _dio.post('$baseUrl/meterreading', data: data);

    if (response.statusCode == 200) { // Adjust status code based on your API
      print('Meter reading submitted successfully!');
      return true;
    } else {
      print('Failed to submit meter reading with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Meter Reading API Error: $e');
    return false;
  }
}
