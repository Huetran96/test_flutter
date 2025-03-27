import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> destinations = [
    {'name': 'Hoi An', 'image': 'assets/hoian.jpg', 'rating': 4.0},
    {'name': 'Sai Gon', 'image': 'assets/sai_gon.jpg', 'rating': 4.5},
    {'name': 'Da Nang', 'image': 'assets/da_nang.jpg', 'rating': 4.2},
    {'name': 'Sapa', 'image': 'assets/sapa.jpg', 'rating': 4.7},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 70),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF8D67ED).withOpacity(0.8), Color(0xFF6E3EF1)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Guy!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('Where are you going next?'),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 30, right: 30, top: 170),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your destination',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryButton(Icons.apartment, 'Hotels', Colors.orange),
                    categoryButton(Icons.flight, 'Flights', Colors.red),
                    categoryButton(Icons.all_inclusive, 'All', Colors.teal),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Popular Destinations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      return destinationCard(destinations[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget categoryButton(IconData icon, String label, Color color) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
      SizedBox(height: 5),
      Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

Widget destinationCard(Map<String, dynamic> destination) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(destination['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: Icon(Icons.favorite, color: Colors.red),
      ),
      Positioned(
        bottom: 10,
        left: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(
                  destination['rating'].toString(),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
