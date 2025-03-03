import 'package:aquaflow/presentation/user/applform1.dart';
import 'package:aquaflow/presentation/user/viewstatus.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text(
          'AQUA FLOW',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Wave design background
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Column(
            children: [
              // Application & Status header text
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Application & Status',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Fill Application Button
                      _customButton(
                        context,
                        icon: Icons.article_outlined,
                        text: 'Fill Your Application Form',
                        onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplicationFormScreen(),
                                ),
                              );
                          // Navigate to Application form
                        },
                      ),
                      const SizedBox(height: 20),
                      // View Status Button
                      _customButton(
                        context,
                        icon: Icons.remove_red_eye_outlined,
                        text: 'View Your Application & Status',
                        onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplicationStatusScreen(),
                                ),
                              );
                          // Navigate to View Status
                        },
                      ),
                      const SizedBox(height: 20),
                      // Add another feature if needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Custom Button Widget
  Widget _customButton(BuildContext context,
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blueAccent),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
