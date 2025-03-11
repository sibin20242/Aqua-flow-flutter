// import 'package:aquaflow/services/loginapi.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class UpdateReadingScreen extends StatefulWidget {
//   final data;

//   const UpdateReadingScreen({super.key, this.data});
//   @override
//   _UpdateReadingScreenState createState() => _UpdateReadingScreenState();
// }

// class _UpdateReadingScreenState extends State<UpdateReadingScreen> {
//   Dio _dio = Dio();

//   // Controllers for user input
//   TextEditingController _currentReadingController = TextEditingController(text: '0.00');
//   TextEditingController _totalUsageController = TextEditingController();
//   TextEditingController _PreviousReadingController = TextEditingController(text: '234');
//   TextEditingController _FixedchargeController = TextEditingController(text: '100.0');
//   TextEditingController _AdvanceController = TextEditingController(text: '0.0');
//   TextEditingController _PriorobligationController = TextEditingController(text: '0.0');
//   TextEditingController _FineController = TextEditingController(text: '0.0');
//   TextEditingController _TotalamountController = TextEditingController();

//   // Function to send data to API


//   Future<void> getdata() async {
//     try {
//       final response = await _dio.get(
//         '$baseUrl/Userdetailsapi/$loginId', // Replace with your actual API endpoint
        
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Reading Updated Successfully!")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to update reading!")),
//         );
//       }
//     } catch (e) {
//       print("Error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error submitting reading!")),
//       );
//     }
//   }
  
//   Future<void> postWork(datas) async {
//     try {
//       final response = await _dio.post(
//         '$baseUrl/Userdetailsapi/$loginId', // Replace with your actual API endpoint
//         data: {
//           // "bill_no": "001",
//           "date":DateTime.now().toString().substring(0,10),
//           "consuming_no":datas['CONSUMER_NO'] ,
//           "name": datas['USER_NAME'],
//           "current_reading": _currentReadingController.text,
//           "total_usage": _totalUsageController.text,
//           "previous_reading": _PreviousReadingController.text,
//           "fixed_charge": _FixedchargeController.text,
//           "advance": _AdvanceController.text,
//           "prior_obligation": _PriorobligationController.text,
//           "fine": _FineController.text,
//           "total_amount": _TotalamountController.text,

//         },
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Reading Updated Successfully!")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to update reading!")),
//         );
//       }
//     } catch (e) {
//       print("Error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error submitting reading!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('object');
//     print(widget.data);
//     double totalamout=double.tryParse(_FixedchargeController.text)!+double.tryParse(_FineController.text)!+double.tryParse(_PriorobligationController.text)!-double.tryParse(_AdvanceController.text)!;
//     _TotalamountController.text=totalamout.toString();
//     double previousReading = double.tryParse(_PreviousReadingController.text) ?? 0.0;
// double currentReading = double.tryParse(_currentReadingController.text) ?? 0.0;
// double totalUsage = currentReading - previousReading;

// _totalUsageController.text = totalUsage.toString(); // Format to 2 decimal places

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: Text(
//           'AQUA FLOW',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               Text(
//                 'UPDATE READING',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.indigo,
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Billing Information
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                   children: [
//                     // TextSpan(text: 'BILL NO: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     // TextSpan(text: '001', style: TextStyle(color: Colors.red)),
//                     TextSpan(text: '      DATE: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: DateTime.now().toString().substring(0,10), style: TextStyle(color: Colors.red)),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'CONSUMING NO: ${widget.data['Consumer_no']??'no num'}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 'NAME: ${widget.data['First_name']??'no num'}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               // Input Fields
//               TextField(
               
//                 controller: _PreviousReadingController,
//                 decoration: InputDecoration(
//                   labelText: "Previous Meter Reading",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 10),
//               TextField(
               
//                 controller: _currentReadingController,
//                 decoration: InputDecoration(
//                   labelText: "Current Meter Reading",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 10),
//               TextField(
//                  readOnly: true,
//                 controller: _totalUsageController,
//                 decoration: InputDecoration(
//                   labelText: "Total Usage",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 10),
//               TextField(
//                  readOnly: true,
//                 controller:_FixedchargeController,
//                 decoration: InputDecoration(
//                   labelText: "Fixed_charge",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
              
//         SizedBox(height: 10),
//               TextField(
//                  readOnly: true,
//                 controller: _AdvanceController,
//                 decoration: InputDecoration(
//                   labelText: " Advance",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 10),
//               TextField(
//                  readOnly: true,
//                 controller: _PriorobligationController,
//                 decoration: InputDecoration(
//                   labelText: "Prior_obligation",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 10),
//               TextField(
//                  readOnly: true,
//                 controller: _FineController,
//                 decoration: InputDecoration(
//                   labelText: "Fine",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                  readOnly: true,
//                 controller: _TotalamountController,
//                 decoration: InputDecoration(
//                   labelText: "Total_amount",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               // Update Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: (){
//                     postWork(widget.data);
//                   }, // Call API when button is clicked
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     'UPDATE',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _currentReadingController.dispose();
//     _totalUsageController.dispose();
//     super.dispose();
//   }
// }
import 'package:aquaflow/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UpdateReadingScreen extends StatefulWidget {
  final dynamic data;
  const UpdateReadingScreen({super.key, this.data});

  @override
  _UpdateReadingScreenState createState() => _UpdateReadingScreenState();
}

class _UpdateReadingScreenState extends State<UpdateReadingScreen> {
  final Dio _dio = Dio();

  TextEditingController _currentReadingController = TextEditingController();
  TextEditingController _totalUsageController = TextEditingController();
  TextEditingController _PreviousReadingController = TextEditingController();
  TextEditingController _FixedchargeController = TextEditingController();
  TextEditingController _AdvanceController = TextEditingController();
  TextEditingController _PriorobligationController = TextEditingController();
  TextEditingController _FineController = TextEditingController();
  TextEditingController _TotalamountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getdata();
    _currentReadingController.addListener(_handleCurrentReadingChange);
    _FixedchargeController.addListener(_updateTotalAmount);
    _PriorobligationController.addListener(_updateTotalAmount);
    _AdvanceController.addListener(_updateTotalAmount);
  }

  void _handleCurrentReadingChange() {
    _updateTotalUsage();
    _updateFine();
    _updateTotalAmount();
  }

  void _updateTotalUsage() {
    double previousReading = double.tryParse(_PreviousReadingController.text) ?? 0.0;
    double currentReading = double.tryParse(_currentReadingController.text) ?? 0.0;
    double totalUsage = currentReading - previousReading;
    _totalUsageController.text = totalUsage.toStringAsFixed(2);
  }

  void _updateFine() {
    double usage = double.tryParse(_totalUsageController.text) ?? 0.0;
    double fine = 0;

    if (usage > 30000) {
      fine = (((usage - 30000) / 100).ceil()) * 10;
    }

    _FineController.text = fine.toStringAsFixed(2);
  }

  void _updateTotalAmount() {
    double fine = double.tryParse(_FineController.text) ?? 0.0;
    double fixedCharge = double.tryParse(_FixedchargeController.text) ?? 0.0;
    double priorObligation = double.tryParse(_PriorobligationController.text) ?? 0.0;
    double advance = double.tryParse(_AdvanceController.text) ?? 0.0;

    double totalAmount = fine + fixedCharge + priorObligation - advance;
    _TotalamountController.text = totalAmount.toStringAsFixed(2);
  }

  Future<void> getdata() async {
    try {
      final response = await _dio.get('$baseUrl/Userdetailsapi/${widget.data["id"]}');
      if (response.statusCode == 200) {
        final data = response.data;

        if (data['readings'] != null && data['readings'].isNotEmpty) {
          final reading = data['readings'][0];

          setState(() {
            _PreviousReadingController.text = reading['Previous_reading']?.toString() ?? '0.0';
            _currentReadingController.text = reading['Current_reading']?.toString() ?? '0.0';
            _FixedchargeController.text = reading['Fixed_charge']?.toString() ?? '0.0';
            _AdvanceController.text = reading['Advance']?.toString() ?? '0.0';
            _PriorobligationController.text = reading['Prior_obligation']?.toString() ?? '0.0';
            _FineController.text = "0.00";

            _handleCurrentReadingChange(); // calculate everything
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No reading data available.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load user data.")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching user data.")),
      );
    }
  }

  Future<void> postWork(datas) async {
    try {
      final response = await _dio.post(
        '$baseUrl/Userdetailsapi/$loginId',
        data: {
          "date": DateTime.now().toString().substring(0, 10),
          "consuming_no": datas['Consumer_no'],
          "name": datas['First_name'],
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('AQUA FLOW', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UPDATE READING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo)),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: '      DATE: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: DateTime.now().toString().substring(0, 10), style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('CONSUMING NO: ${widget.data['Consumer_no'] ?? 'no num'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('NAME: ${widget.data['First_name'] ?? 'no name'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            buildTextField("Previous Meter Reading", _PreviousReadingController, readOnly: true),
            buildTextField("Current Meter Reading", _currentReadingController),
            buildTextField("Total Usage", _totalUsageController, readOnly: true),
            buildTextField("Fixed_charge", _FixedchargeController),
            buildTextField("Advance", _AdvanceController),
            buildTextField("Prior_obligation", _PriorobligationController),
            buildTextField("Fine", _FineController, readOnly: true),
            buildTextField("Total_amount", _TotalamountController, readOnly: true),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => postWork(widget.data),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('UPDATE', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  void dispose() {
    _currentReadingController.removeListener(_handleCurrentReadingChange);
    _FixedchargeController.removeListener(_updateTotalAmount);
    _PriorobligationController.removeListener(_updateTotalAmount);
    _AdvanceController.removeListener(_updateTotalAmount);

    _currentReadingController.dispose();
    _totalUsageController.dispose();
    _PreviousReadingController.dispose();
    _FixedchargeController.dispose();
    _AdvanceController.dispose();
    _PriorobligationController.dispose();
    _FineController.dispose();
    _TotalamountController.dispose();
    super.dispose();
  }
}
