import 'package:aquaflow/services/loginapi.dart';
import 'package:aquaflow/services/user/feedbackapi.dart';
import 'package:flutter/material.dart';



class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AQUA FLOW'),
        actions: [
        
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feedback & Rating About Staff',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Type Something',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green,
            //   ),
            //   onPressed: () {
            //     // Handle feedback submission
            //     print('Feedback: ${_feedbackController.text}');
            //   },
            //   child: const Text('SEND'),
            // ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedRating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedRating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {



                submitFeedback(data: {
                  'USER': loginId,
                  // 'Complaint_no': 2 ,
                  // 'Consumer_no': 4 ,
                  'Rating': _selectedRating,
                  'Feedback': _feedbackController.text

                });
                // Handle rating submission
                print('Rating: $_selectedRating');
              },
              child: const Text('RATE'),
            ),
          ],
        ),
      ),
    );
  }
}
