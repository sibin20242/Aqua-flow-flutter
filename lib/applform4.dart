import 'package:flutter/material.dart';



class applicationforms extends StatefulWidget {
  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<applicationforms> {
  bool isAgreed = false;

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
                        backgroundColor: Colors.green,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Form Content
                  Text(
                    "STATEMENT OF TRUTH",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Please Inform That I Currently Do Not Have Adequate Drinking Water Source And Would Like To Get Drinking Water Connection",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isAgreed,
                        onChanged: (value) {
                          setState(() {
                            isAgreed = value!;
                          });
                        },
                      ),
                      Text("Agree"),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Date and Place Input
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Place",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Submit Buttons
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
                          if (isAgreed) {
                            // Perform submit action
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Form Submitted!"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Please agree to the terms to submit."),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: Text("SUBMIT"),
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
}