import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay the navigation to the login screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/home.png', // Replace with your actual image path
                height: 200,
                width: 200,
              ),
               Text(
                'Lorem',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
               Text(
                'IPSUM',
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 10,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
