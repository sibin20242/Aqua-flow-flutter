import 'package:flutter/material.dart';



// Home Screen
class HomeScreen5 extends StatelessWidget {
  const HomeScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Title
            Stack(
              children: [
                Image.network(
                  '',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Effortless',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Property Discovery',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Property Type Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTab('House', true),
                  _buildTab('Apartment', false),
                  _buildTab('Land', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Search and Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Min \$50,000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.attach_money),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Add Filter'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

// Map View Screen
class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Smart search here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Image.network(
                'https://via.placeholder.com/400x400',
                fit: BoxFit.cover,
              ), // Map Placeholder
            ),
          ),
          // Pagination
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                6,
                (index) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  onPressed: () {},
                  child: Text('${index + 1}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Details Screen
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://via.placeholder.com/400x300',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'House for sale at Dafros Residence',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Gumpang, Kartasura, Surakarta'),
                SizedBox(height: 20),
                Text('\$75,000',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.bed),
                    SizedBox(width: 5),
                    Text('3 Beds'),
                    SizedBox(width: 20),
                    Icon(Icons.bathtub),
                    SizedBox(width: 5),
                    Text('2 Bath'),
                    SizedBox(width: 20),
                    Icon(Icons.square_foot),
                    SizedBox(width: 5),
                    Text('240 m²'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
