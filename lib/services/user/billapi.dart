import 'package:dio/dio.dart';

Dio _dio = Dio();

String baseUrl = "http://your-api-url.com/api"; // Replace with your base URL

Future<bool> createBill({
  required String user,
  required double previousMeterReading,
  required double currentMeterReading,
  required double totalUsage,
  required double fixedCharge,
  required double priorObligation,
  required double advance,
  required double fine,
  required double totalAmount,
}) async {
  try {
    // Data to be sent in the POST request
    final data = {
      "USER": user,
      "Previous_MeterReading": previousMeterReading,
      "Current_MeterReading": currentMeterReading,
      "Total_Usage": totalUsage,
      "Fixed_Charge": fixedCharge,
      "Prior_Obligation": priorObligation,
      "Advance": advance,
      "Fine": fine,
      "Total_Amount": totalAmount,
    };

    // Sending POST request
    final response = await _dio.post('$baseUrl/bill', data: data);

    if (response.statusCode == 201) { // Adjust status code based on your API
      print('Bill created successfully!');
      return true;
    } else {
      print('Bill creation failed with status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Bill API Error: $e');
    return false;
  }
}
