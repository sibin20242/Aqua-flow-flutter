import 'package:aquaflow/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UpdateReadingScreen extends StatefulWidget {
  final data;

  const UpdateReadingScreen({super.key, this.data});
  @override
  _UpdateReadingScreenState createState() => _UpdateReadingScreenState();
}

class _UpdateReadingScreenState extends State<UpdateReadingScreen> {
  Dio _dio = Dio();

  // Controllers for user input
  TextEditingController _currentReadingController = TextEditingController(text: '0.00');
  TextEditingController _totalUsageController = TextEditingController();
  TextEditingController _PreviousReadingController = TextEditingController(text: '234');
  TextEditingController _FixedchargeController = TextEditingController(text: '100.0');
  TextEditingController _AdvanceController = TextEditingController(text: '0.0');
  TextEditingController _PriorobligationController = TextEditingController(text: '0.0');
  TextEditingController _FineController = TextEditingController(text: '0.0');
  TextEditingController _TotalamountController = TextEditingController();

  // Function to send data to API
  Future<void> postWork(datas) async {
    try {
      final response = await _dio.post(
        '$baseUrl/UpdateReportapi', // Replace with your actual API endpoint
        data: {
          // "bill_no": "001",
          "date":DateTime.now().toString().substring(0,10),
          "consuming_no":datas['CONSUMER_NO'] ,
          "name": datas['USER_NAME'],
          "current_reading": _currentReadingController.text,
          "total_usage": _totalUsageController.text,
          "previous_reading": _PreviousReadingController.text,
          "fixed_charge": _FixedchargeController.text,
          "advance": _AdvanceController.text,
          "prior_obligation": _PriorobligationController.text,
          "fine": _FineController.text,
          "total_amount": _TotalamountController.text,

        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Reading Updated Successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update reading!")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error submitting reading!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    print(widget.data);
    double totalamout=double.tryParse(_FixedchargeController.text)!+double.tryParse(_FineController.text)!+double.tryParse(_PriorobligationController.text)!-double.tryParse(_AdvanceController.text)!;
    _TotalamountController.text=totalamout.toString();
    double previousReading = double.tryParse(_PreviousReadingController.text) ?? 0.0;
double currentReading = double.tryParse(_currentReadingController.text) ?? 0.0;
double totalUsage = currentReading - previousReading;

_totalUsageController.text = totalUsage.toString(); // Format to 2 decimal places

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'AQUA FLOW',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'UPDATE READING',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),
              // Billing Information
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    // TextSpan(text: 'BILL NO: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    // TextSpan(text: '001', style: TextStyle(color: Colors.red)),
                    TextSpan(text: '      DATE: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: DateTime.now().toString().substring(0,10), style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'CONSUMING NO: ${widget.data['Consumer_no']??'no num'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'NAME: ${widget.data['First_name']??'no num'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Input Fields
              TextField(
               
                controller: _PreviousReadingController,
                decoration: InputDecoration(
                  labelText: "Previous Meter Reading",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
               
                controller: _currentReadingController,
                decoration: InputDecoration(
                  labelText: "Current Meter Reading",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                 readOnly: true,
                controller: _totalUsageController,
                decoration: InputDecoration(
                  labelText: "Total Usage",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                 readOnly: true,
                controller:_FixedchargeController,
                decoration: InputDecoration(
                  labelText: "Fixed_charge",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              
        SizedBox(height: 10),
              TextField(
                 readOnly: true,
                controller: _AdvanceController,
                decoration: InputDecoration(
                  labelText: " Advance",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                 readOnly: true,
                controller: _PriorobligationController,
                decoration: InputDecoration(
                  labelText: "Prior_obligation",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                 readOnly: true,
                controller: _FineController,
                decoration: InputDecoration(
                  labelText: "Fine",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                 readOnly: true,
                controller: _TotalamountController,
                decoration: InputDecoration(
                  labelText: "Total_amount",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              // Update Button
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    postWork(widget.data);
                  }, // Call API when button is clicked
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'UPDATE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentReadingController.dispose();
    _totalUsageController.dispose();
    super.dispose();
  }
}
