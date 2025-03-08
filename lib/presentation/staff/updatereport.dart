import 'dart:io';
import 'package:aquaflow/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class UpdateReportScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  UpdateReportScreen({Key? key, required this.data}) : super(key: key);

  @override
  _UpdateReportScreenState createState() => _UpdateReportScreenState();
}

class _UpdateReportScreenState extends State<UpdateReportScreen> {
  File? _selectedImage;
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  Dio _dio = Dio();
  TextEditingController disc=TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _updateReport() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image to upload")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      FormData formData = FormData.fromMap({
        'description':disc.text,
        "STAFF": loginId, // Replace with actual staff ID if needed
        "Consumer_no": widget.data['CONSUMER_NO'] ?? 'Unknown',
        "Upload_photo": await MultipartFile.fromFile(_selectedImage!.path, filename: 'upload_photo.jpg'),
      });

      final response = await _dio.post(
        '$baseUrl/UpdateReportapi',
        data: formData,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Report updated successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update report. Try again.")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating report")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('AQUA FLOW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.blue[900])),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[900]!, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Update Report',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CONSUMER NUMBER: ${widget.data['CONSUMER_NO'] ?? '4567'}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('COMPLAINT:  ${widget.data['COMPLAINTS'][0]['Complaint']??'not avail'}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: disc,
                  decoration: InputDecoration(
                    hintText: 'Type Something',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.green, width: 2),
                      ),
                      onPressed: _pickImage,
                      child: Row(
                        children: [
                          Icon(Icons.photo, color: Colors.green),
                          SizedBox(width: 10),
                          Text('Upload Photo', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: isLoading ? null : _updateReport,
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('SEND', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
                if (_selectedImage != null) ...[
                  SizedBox(height: 20),
                  Center(
                    child: Image.file(_selectedImage!, height: 150, fit: BoxFit.cover),
                  ),
                ],
              ],
              
            ),
          ),
        ],
      ),
    );
  }
}


