import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: "Traveling",
                icon: Icons.flight_class,
                color: Colors.green,
              ),
              HobbyCard(
                title: "Skating",
                icon: Icons.safety_check,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(bottom: 10),

      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 20,
                top: 30,
                bottom: 30,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 22)),
          ],
        ), 
      ),
    );
  }
}



