import 'package:aquaflow/presentation/staff/assignedwork.dart';
import 'package:aquaflow/presentation/staff/chatselect.dart';
import 'package:aquaflow/presentation/staff/updatereading.dart';
import 'package:aquaflow/presentation/staff/updatereport.dart';
import 'package:aquaflow/presentation/staff/userdetails.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PWMS', style: TextStyle(fontWeight: FontWeight.bold)),
      //   backgroundColor: Colors.black,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      //     SizedBox(width: 8),
      //   ],
      // ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            color: Colors.blue[900],
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue[200],
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WELCOME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'PRANAV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildMenuCard(
                  icon: Icons.assignment,
                  title: 'Assigned work',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssignedWorkScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuCard(
                  icon: Icons.update,
                  title: 'Update report',
                  onTap: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateReportScreen(),
                                ),
                              );
                  },
                ),
                _buildMenuCard(
                  icon: Icons.chat,
                  title: 'Chat With user & authority',
                  onTap: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen2(),
                                ),
                              );
                  },
                ),
                _buildMenuCard(
                  icon: Icons.person,
                  title: 'User details',
                  onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen(),
                                ),
                              );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateReadingScreen(),
                                ),
                              );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black, width: 1.5),
              ),
              icon: Icon(Icons.speed),
              label: Text('Update meter reading'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue[700]),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
