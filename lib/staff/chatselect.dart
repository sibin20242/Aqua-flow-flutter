import 'package:aquaflow/staff/chatAuth.dart';
import 'package:aquaflow/staff/chatUserd.dart';
import 'package:flutter/material.dart';



class ChatScreen2 extends StatelessWidget {
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
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              'Chat With user & authority',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChatButton(
                  label: 'Chat With user',
                  onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserListScreen(),
                                ),
                              );},
                ),
                SizedBox(height: 20),
                ChatButton(
                  label: 'Chat With authority',
                  onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ),
                              );},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  ChatButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.chat, color: Colors.red),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
