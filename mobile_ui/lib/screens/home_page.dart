import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ui/bloc/destination_bloc.dart';
import 'package:mobile_ui/bloc/destination_state.dart';
import 'package:mobile_ui/data/destination.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                BlocBuilder<DestinationBloc, DestinationState>(
                  builder: (context, state){
                    if(state is DestinationLoading){
                      return Container(
                        child: CircularProgressIndicator()
                      );
                    }else if(state is DestinationLoaded) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: state.destinations!.length,
                          itemBuilder: (context, index) {
                            return destinationCard(state.destinations![index]);
                          },
                        ),
                      );
                    }else if(state is DestinationFulure){
                      return Container(
                        child: Text(state.message!),
                      );
                    }
                    return Container(
                      child: Text('Empty.'),
                    );
                  },

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

Widget destinationCard(Destination destination) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(destination.image!),
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
              destination.name!,
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
                  destination.rating!.toString(),
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
