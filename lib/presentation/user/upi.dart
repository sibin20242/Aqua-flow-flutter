import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _selectedPaymentMethod = 'Google Pay'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('AQUA FLOW', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PAYMENT',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  PaymentOptionRow(
                    icon: Image.network('https://w7.pngwing.com/pngs/667/120/png-transparent-google-pay-2020-hd-logo-thumbnail.png'),
                    label: 'Google Pay',
                    isSelected: _selectedPaymentMethod == 'Google Pay',
                    onTap: () => _onPaymentMethodSelected('Google Pay'),
                  ),
                  PaymentOptionRow(
                    icon: Image.network('https://w7.pngwing.com/pngs/632/1015/png-transparent-paypal-logo-computer-icons-payment-paypal-blue-angle-service-thumbnail.png'),
                    label: 'Paypal',
                    isSelected: _selectedPaymentMethod == 'Paypal',
                    onTap: () => _onPaymentMethodSelected('Paypal'),
                  ),
                  PaymentOptionRow(
                    icon: Image.network('https://w7.pngwing.com/pngs/473/389/png-transparent-apple-pay-mobile-payment-apple-wallet-apple-text-service-rectangle-thumbnail.png'),
                    label: 'Apple Pay',
                    isSelected: _selectedPaymentMethod == 'Apple Pay',
                    onTap: () => _onPaymentMethodSelected('Apple Pay'),
                  ),
                  PaymentOptionRow(
                    icon: Image.network('https://i.pinimg.com/736x/b2/e1/af/b2e1af76fbbe9bc446544b8fa71b37b1.jpg'),
                    label: 'Phone Pay',
                    isSelected: _selectedPaymentMethod == 'Phone Pay',
                    onTap: () => _onPaymentMethodSelected('Phone Pay'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: const [
                  PaymentSummaryRow(label: 'Fixed charge', value: '100'),
                  PaymentSummaryRow(label: 'Prior obligation', value: '000'),
                  PaymentSummaryRow(label: 'Advance', value: '000'),
                  PaymentSummaryRow(label: 'Fine', value: '000'),
                  Divider(),
                  PaymentSummaryRow(label: 'Total amount', value: '100', isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _payNow();
                },
                child: const Text(
                  'PAY NOW',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPaymentMethodSelected(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  void _payNow() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Confirmation'),
        content: Text('Are you sure you want to pay using $_selectedPaymentMethod?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle actual payment logic here
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

class PaymentOptionRow extends StatelessWidget {
  final  icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionRow({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(label),
      trailing: Radio(
        value: true,
        groupValue: isSelected,
        onChanged: (value) => onTap(),
      ),
    );
  }
}

class PaymentSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const PaymentSummaryRow({
    required this.label,
    required this.value,
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
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
