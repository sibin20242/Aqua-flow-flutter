import 'package:aquaflow/presentation/staff/viewassignedwork.dart';
import 'package:aquaflow/services/loginapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AssignedWorkScreen extends StatefulWidget {
  @override
  _AssignedWorkScreenState createState() => _AssignedWorkScreenState();
}

class _AssignedWorkScreenState extends State<AssignedWorkScreen> {
  List<Map<String ,dynamic>> names = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAssignedWorks();
  }

  // Function to fetch assigned work from API
  Future<void> fetchAssignedWorks() async {
    try {
      var dio = Dio();
      Response response = await dio.get('$baseUrl/Assignedworkapi/$loginId');
print(response.data);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        setState(() {
          names = List<Map<String ,dynamic>>.from(response.data);
          isLoading = false;
        });
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      print('API Request Error: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('AQUA FLOW', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.indigo[900],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    'Assigned Work',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: isLoading
                    ? Center(child: CircularProgressIndicator()) // Show loader while fetching data
                    : ListView.builder(
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 3,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue[100],
                                  child: Icon(Icons.person, color: Colors.blue),
                                ),
                                title: Text(
                                  names[index]['USER_NAME']??"no name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AssignedWorkScreen1(data:names[index]),
                                      ),
                                    );
                                  },
                                  child: Text('VIEW'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
