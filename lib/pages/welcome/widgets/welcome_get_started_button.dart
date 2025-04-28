import 'package:flutter/material.dart';

// Get Started Button Widget
Widget buildGetStartedButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    child: SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // You can navigate to your main app or home page here
          Navigator.pushReplacementNamed(context, '/home');
          // or use your specific route
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "Get Started",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
