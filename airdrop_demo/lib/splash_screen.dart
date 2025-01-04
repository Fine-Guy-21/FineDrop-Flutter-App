import 'package:flutter/material.dart';
import 'package:airdrop_demo/main.dart';
import 'dart:async'; // For simulating loading delay

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Simulate a loading delay (e.g., fetching resources)
    await Future.delayed(Duration(seconds: 5)); // Adjust the duration as needed

    // Navigate to the main screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyApp()), // Replace with your Home Screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Airdrop Demo',
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flutter_dash,
                    size: 100, color: Colors.blue), // Replace with your logo
                SizedBox(height: 20),
                CircularProgressIndicator(), // Loading indicator
                SizedBox(height: 10),
                Text("Loading... Please wait"),
              ],
            ),
          ),
        ));
  }
}
