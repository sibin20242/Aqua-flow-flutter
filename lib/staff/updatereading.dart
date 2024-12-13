import 'package:flutter/material.dart';


class UpdateReadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'AQUA FLOW',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
       
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              'UPDATE READING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20),
            // Billing Information
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(text: 'BILL NO: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '001', style: TextStyle(color: Colors.red)),
                  TextSpan(text: '      DATE: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'DD/MM/YYYY', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CONSUMING NO: 11112222',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'NAME: ISMAIL',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Table Section
            Expanded(
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                },
                children: [
                  _buildTableRow('Previous meter reading', 'XXXXX', isBold: true),
                  _buildTableRow('Current meter reading', 'XXXXX'),
                  _buildTableRow('Total usage', 'XXXXX', isBold: true),
                  _buildTableRow('Fixed charge', '100', color: Colors.red),
                  _buildTableRow('Prior obligation', '-------', color: Colors.red),
                  _buildTableRow('Advance', '-------', color: Colors.red),
                  _buildTableRow('Fine', '-------', color: Colors.red),
                  _buildTableRow('Total amount', '100', color: Colors.red, isBold: true),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Update Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Update Action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'UPDATE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Function for Table Rows
  TableRow _buildTableRow(String title, String value,
      {bool isBold = false, Color color = Colors.black}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
