import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'name': 'ISMAIL', 'id': '11112222', 'phone': '6528867540'},
    {'name': 'SHANID', 'id': '11113333', 'phone': 'PHONE NUMBER'},
    {'name': 'FASAL', 'id': '11114444', 'phone': 'PHONE NUMBER'},
    {'name': 'JOEL', 'id': '11115555', 'phone': 'PHONE NUMBER'},
    {'name': 'SHAMIL', 'id': '11116666', 'phone': 'PHONE NUMBER'},
    {'name': 'APPUKUTTAN', 'id': '11117777', 'phone': 'PHONE NUMBER'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PWMS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
       
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          SizedBox(width: 8),
        ],
      ),
     
      body: Column(
        children: [
          Container(
            color: Colors.blue[900],
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'user details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'PRANAV',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[200],
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.blue[900],
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PANCHAYATH NAME',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[200],
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(users[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(users[index]['id']!),
                        Text(users[index]['phone']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserDetailsScreen(),
  ));
}
