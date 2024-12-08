import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadDocumentsScreen extends StatefulWidget {
  @override
  _UploadDocumentsScreenState createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded: ${image.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PWSMS", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue[900],
              padding: EdgeInsets.all(10),
              child: Text(
                "AQUA FLOW",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Step Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => CircleAvatar(
                        backgroundColor:
                            index < 3 ? Colors.green : Colors.grey,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Document Upload Section
                  _buildUploadSection(
                    title: "SUBMIT THE OWNERSHIP CERTIFICATE OF THE BUILDING",
                  ),
                  SizedBox(height: 20),
                  _buildUploadSection(
                    title: "SUBMIT COPY OF AADHAAR CARD",
                  ),
                  SizedBox(height: 20),
                  _buildUploadSection(
                    title: "SUBMIT COPY OF RATION CARD",
                  ),
                  SizedBox(height: 20),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: Text("BACK"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Proceeding to Next Step!")),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: Text("NEXT"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, color: Colors.blue, size: 40),
                  SizedBox(height: 5),
                  Text("Upload Photo", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}