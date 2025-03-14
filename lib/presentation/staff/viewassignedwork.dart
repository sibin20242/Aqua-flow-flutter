import 'package:aquaflow/presentation/staff/chatUser.dart';
import 'package:aquaflow/presentation/staff/updatereport.dart';
import 'package:flutter/material.dart';

class AssignedWorkScreen1 extends StatelessWidget {
  final data;

  const AssignedWorkScreen1({super.key, this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text('PWSMS'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[900],
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:  [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back, color: Colors.white),),
                    SizedBox(width: 8.0),
                    Text(
                      'Assigned Work',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                // Row(
                //   children: const [
                //     Text(
                //       'PRANAV',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     SizedBox(width: 8.0),
                //     CircleAvatar(
                //       backgroundColor: Colors.grey,
                //       child: Icon(Icons.person, color: Colors.white),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      data['Area']??'not available',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children:  [
                        Icon(Icons.person, color: Colors.grey),
                        SizedBox(width: 8.0),
                        Text(data['USER_NAME']??'not available'),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('CONSUMER NUMBER    :  ${data['CONSUMER_NO']??'not'}'),
                          SizedBox(height: 8.0),
                          
                          SizedBox(height: 8.0),
                          Text('PHONE NUMBER       :    ${data['PHONE_NO']??'not'}')
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16.0),
                    const Text(
                      'Complaints',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                     SizedBox(height: 8.0),
                     if(data['COMPLAINTS'].length!=0)
                    Text(' ${data['COMPLAINTS'][0]['Complaint']??'not avail'}'

                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateReportScreen(data:data),
                                ),
                              );
                      },
                      icon: const Icon(Icons.chat, color: Colors.red),
                      label: const Text('Update report'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


