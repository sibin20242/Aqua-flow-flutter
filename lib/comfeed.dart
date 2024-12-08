import 'package:flutter/material.dart';

class ComplaintFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text(
          'AQUA FLOW',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'I',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Decorative Header
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Complaint&Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48), // Placeholder to balance the layout
              ],
            ),
          ),
          SizedBox(height: 20),
          // Main Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Complaints Button
                GestureDetector(
                  onTap: () {
                    // Handle Complaints action
                  },
                  child: Column(
                    children: [
                      Icon(Icons.report_problem, size: 60, color: Colors.black),
                      SizedBox(height: 10),
                      Text(
                        "COMPLAINTS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // Feedback Button
                GestureDetector(
                  onTap: () {
                    // Handle Feedback action
                  },
                  child: Column(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined,
                          size: 60, color: Colors.black),
                      SizedBox(height: 10),
                      Text(
                        "FEEDBACK & RATING\nABOUT STAFF",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ComplaintFeedbackScreen(),
  ));
}
