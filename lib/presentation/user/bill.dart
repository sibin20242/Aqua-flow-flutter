import 'package:aquaflow/presentation/user/upi.dart';
import 'package:flutter/material.dart';

class BillPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text(
          'AQUA FLOW',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Decorative Header
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Bill & Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48), // Placeholder to balance the layout
              ],
            ),
          ),
          SizedBox(height: 20),
          // Bill Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BILL NO : 001',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'DATE : 30/09/2024',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'CONSUMING NO : 11112222',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'NAME : ISMAIL',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Table
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  buildTableRow('Previous meter reading', '63754'),
                  buildTableRow('Current meter reading', '92317'),
                  buildTableRow('Total usage', '28563'),
                  buildTableRow('Fixed charge', '100'),
                  buildTableRow('Prior obligation', '000'),
                  buildTableRow('Advance', '000'),
                  buildTableRow('Fine', '000'),
                  buildTableRow('Total amount', '100'),
                ],
              ),
            ),
          ),
          // Payment Button
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payment()),
                  );
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.network(
                    'https://imgs.search.brave.com/E0DpJk1CN7n-mPAvmvW41f3Dek77yuIygqXp31vX23Y/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA1LzYwLzUwLzE2/LzM2MF9GXzU2MDUw/MTYwN194N2NyeHFC/V2JtYmdLMms4ek9M/MGdJQ2JJYks5aFA2/eS5qcGc', // Provide your UPI logo path
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Pay by any UPI app',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}


