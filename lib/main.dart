import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/eco_tracker_page.dart';
import 'screens/ar_tour_page.dart';
import 'screens/interactive_guide_page.dart';
import 'package:eco_tour_indonesia/screens/mountain_guide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile_page.dart': (context) => ProfilePage(),
        '/eco_tracker_page.dart': (context) => EcoTrackerPage(),
        '/ar_tour_page.dart': (context) => ArTourPage(),
        '/interactiveGuide': (context) => InteractiveGuidePage(),
        '/interactive_guide_page': (context) => InteractiveGuidePage(),
        '/mountain_guide_page': (context) => MountainGuidePage(),
      },
    );
  }
}
