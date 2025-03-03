import 'package:aquaflow/presentation/user/feedbackrating.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:aquaflow/services/user/complaintapi.dart';
import 'package:flutter/material.dart';



class ComplaintPage extends StatefulWidget {
  final complaints;

  const ComplaintPage({super.key, this.complaints});
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  String? selectedComplaintType;
  final TextEditingController _complaintController = TextEditingController();

  final List<String> complaintTypes = [
    'Meter Complaint',
    'Water Leakage',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          'AQUA FLOW',
          style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
        ),
        
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


         




          children: [
            Text(
              'Complaints',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Complaint Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedComplaintType,
              items: complaintTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedComplaintType = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _complaintController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Type Something',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Handle submit action
                  if (selectedComplaintType != null && _complaintController.text.isNotEmpty) {




                    submitComplaint(data: {
                      'USER':loginId,
                      'complaint_type': selectedComplaintType,
                      'Complaints': _complaintController.text

                    });
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => AlertDialog(
                    //     title: Text('Complaint Submitted'),
                    //     content: Text('Your complaint has been submitted successfully!'),
                    //     actions: [
                    //       TextButton(
                    //         onPressed: () => Navigator.pop(context),
                    //         child: Text('OK'),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill all fields'),
                      ),
                    );
                  }
                },
                child: Text(
                  'SEND',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 30,),
            Expanded(child: ListView.builder(itemCount: 3,
              itemBuilder: (context, index) {
                final cmplint=widget.complaints[index];
              return ListTile(
                title: Text(cmplint['Complaints']??'not available'),
                subtitle: Text(cmplint['complaint_type']??"not available"),
                trailing: IconButton(onPressed: (){
                     
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  
                }, icon: Icon(Icons.star,color: Colors.amber,)),
                );
            },))
          ],
        ),
      ),
    );
  }
}
