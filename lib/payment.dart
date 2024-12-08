import 'package:flutter/material.dart';



class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        title: Text(
          'AQUA FLOW',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  PaymentOption(
                    icon: Icons.g_mobiledata,
                    label: 'Google Pay',
                    selected: true,
                  ),
                  Divider(),
                  PaymentOption(
                    icon: Icons.paypal,
                    label: 'Paypal',
                    selected: false,
                  ),
                  Divider(),
                  PaymentOption(
                    icon: Icons.apple,
                    label: 'Apple Pay',
                    selected: false,
                  ),
                  Divider(),
                  PaymentOption(
                    icon: Icons.phone_android,
                    label: 'Phone Pay',
                    selected: false,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaymentDetail(label: 'Fixed charge', amount: '100'),
                  PaymentDetail(label: 'Prior obligation', amount: '000'),
                  PaymentDetail(label: 'Advance', amount: '000'),
                  PaymentDetail(label: 'Fine', amount: '000'),
                  Divider(),
                  PaymentDetail(
                    label: 'Total amount',
                    amount: '100',
                    isBold: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              'PAY NOW',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const PaymentOption({
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo[900], size: 30),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            color: selected ? Colors.indigo[900] : Colors.grey,
          ),
        ],
      ),
    );
  }
}

class PaymentDetail extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  const PaymentDetail({
    required this.label,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.black : Colors.red,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.black : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
