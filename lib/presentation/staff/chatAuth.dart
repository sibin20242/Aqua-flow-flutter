import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'sender': 'authority', 'message': 'HELLO'},
    {'sender': 'user', 'message': ''}, // Empty message for visual placeholder
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
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 8),
                Text(
                  'Chat With Authority',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isAuthority = message['sender'] == 'authority';

                  return Align(
                    alignment: isAuthority
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: isAuthority
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isAuthority)
                          CircleAvatar(
                            backgroundColor: Colors.blue[200],
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        if (!isAuthority) SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: isAuthority
                                  ? [Colors.blue, Colors.green]
                                  : [Colors.blue[300]!, Colors.blue[700]!],
                            ),
                          ),
                          child: Text(
                            message['message']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (isAuthority) SizedBox(width: 8),
                        if (isAuthority)
                          CircleAvatar(
                            backgroundColor: Colors.blue[200],
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.grey[800],
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type . . .',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue[300]),
                  onPressed: () {
                    // Add send message logic here
                  },
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
    debugShowCheckedModeBanner: false,
    home: ChatScreen(),
  ));
}
