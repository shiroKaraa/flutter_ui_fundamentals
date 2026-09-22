import 'package:flutter/material.dart';
const String studentName = 'I Kadek Dwi Bajaskara';
const String studentId = '2415051068';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Fundamentals'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$studentId - $studentName',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 13),
              const Text(
                'Latihan Widget Tree',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Image.asset(
                'assets/images/profile.jpg',
                width: 60,
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}