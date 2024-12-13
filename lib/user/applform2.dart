import 'package:aquaflow/user/applform3.dart';
import 'package:flutter/material.dart';



class ApplicationFormStep2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "AQUA FLOW",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepIndicator(isActive: true),
                StepIndicator(isActive: true),
                StepIndicator(),
                StepIndicator(),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'NUMBER OF FAMILY MEMBERS',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'AADHAAR NO',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'RATION CARD (BPL/APL)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'NEIGHBOUR CONSUMPTION NO',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'BELONGING TO SCHEDULED CASTES/SCHEDULED TRIBES?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('BACK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UploadDocumentsScreen(),
                                ),
                              );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('NEXT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final bool isActive;

  StepIndicator({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
