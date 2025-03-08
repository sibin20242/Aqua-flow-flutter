import 'package:aquaflow/presentation/staff/updatereading.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  List<Map<String, dynamic>> users = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      var response = await Dio().get('$baseUrl/Userdetailsapi');
      print(response.data);
      if (response.statusCode == 200) {
        setState(() {
          users = List<Map<String, dynamic>>.from(response.data);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load data.";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error fetching data: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: Colors.blue[900],
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(
                  'User Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[200],
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ),
          
          // Search Bar
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // User List
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)))
                    : ListView.builder(
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
                              title: Text(
                                users[index]['First_name'] ?? 'Unknown',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Consumer_No: ${users[index]['Consumer_no'] ?? 'N/A'}"),
                                  Text("Phone: ${users[index]['Phone_no'] ?? 'N/A'}"),
                                ],
                              ),
                              trailing: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateReadingScreen(
                                        data: users[index], // Pass the user data correctly
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.speed, color: Color.fromARGB(255, 0, 0, 0)),
                                label: Text(''),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  side: BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
    home: UserDetailsScreen(),
  ));
}
