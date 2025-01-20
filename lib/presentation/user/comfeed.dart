import 'package:aquaflow/services/user/viewComplaint.dart';
import 'package:flutter/material.dart';
import 'package:aquaflow/presentation/user/complaint.dart';

class ComplaintFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 2, 54),
        elevation: 0,
        title: const Text(
          'AQUA FLOW',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
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
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                
                Expanded(
                  child: const Text(
                    'Complaint & Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // Placeholder to balance the layout
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Main Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Complaints Button
                InkWell(
                  onTap: ()async {
               List<Map<String, dynamic>>complaints=await     viewComplaint();
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComplaintPage(complaints: complaints,)),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent.withOpacity(0.1),
                        ),
                        child: const Icon(
                          Icons.report_problem,
                          size: 50,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "COMPLAINTS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Feedback Button
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => FeedbackPage()),
                //     );
                //   },
                //   child: Column(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(16.0),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.blueAccent.withOpacity(0.1),
                //         ),
                //         child: const Icon(
                //           Icons.thumb_up,
                //           size: 50,
                //           color: Colors.blueAccent,
                //         ),
                //       ),
                //       const SizedBox(height: 10),
                //       const Text(
                //         "FEEDBACK & RATING\nABOUT STAFF",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


