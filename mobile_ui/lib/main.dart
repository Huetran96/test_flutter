import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ui/bloc/destination_bloc.dart';
import 'package:mobile_ui/screens/home_page.dart';
import 'package:mobile_ui/screens/profile_page.dart';
import 'package:mobile_ui/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> DestinationBloc()..fetchData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final appScreen = [
     HomePage(),
    const SearchPage(),
    const ProfilePage()
  ];
  int sellectedIndex = 0;
  void _onTap(int index){
    setState(() {
      sellectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreen[sellectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
          currentIndex: sellectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile')
          ]
      ),
    );
  }
}

