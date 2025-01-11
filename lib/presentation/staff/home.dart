import 'package:aquaflow/presentation/staff/assignedwork.dart';
import 'package:aquaflow/presentation/staff/chatselect.dart';
import 'package:aquaflow/presentation/staff/updatereading.dart';
import 'package:aquaflow/presentation/staff/updatereport.dart';
import 'package:aquaflow/presentation/staff/userdetails.dart';
import 'package:aquaflow/presentation/user/language.dart';
import 'package:aquaflow/presentation/user/login.dart';
import 'package:aquaflow/presentation/user/profile.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:aquaflow/services/user/viewprofileapi.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
       appBar: AppBar(
        title: const Text(
          'AQUA FLOW',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 1, 48),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification icon action
            },
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer action
            },
          ),
        ),
      ),
    
          drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 15, 1, 48),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                ),
                accountName: const Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail:  Text(
                                '${PROFILEDATA?['First_name'] ?? ''} ${PROFILEDATA?['Mid_name'] ?? ''} ${PROFILEDATA?['Last_name'] ?? ''}',

                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              // Drawer Items with Links
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text(
                  'PROFILE',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: ()async {
         await    fetchUserProfile();
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                              );
                
                },
              ),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.white),
                title: const Text(
                  'LANGUAGE',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LanguageSelectionScreen(),
                                ),
                              );
                },
              ),
              ListTile(
                leading: const Icon(Icons.light_mode, color: Colors.white),
                title: const Text(
                  'MODE',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Add functionality for light/dark mode toggle
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.white),
                title: const Text(
                  'ABOUT',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to About page or display information
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.white),
                title: const Text(
                  'SHARE',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Add share functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'LOG OUT',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  snackbarwiidget(context, 'loging out..');
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctxt)=>Login()));
                  // Log out functionality
                },
              ),
            ],
          ),
        ),
      ),
      
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
