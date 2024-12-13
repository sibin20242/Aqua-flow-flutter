import 'package:flutter/material.dart';



class UpdateReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('AQUA FLOW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.blue[900]),
          ),
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
                  'update report',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CONSUMER NUMBER: 11112222',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('APPLICATION NUMBER: 012',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Type Something',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.green, width: 2),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.photo, color: Colors.green),
                          SizedBox(width: 10),
                          Text('upload photo', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('SEND', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
