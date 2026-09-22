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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ===== FOTO PROFIL =====
              const CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 12),

              // ===== NAMA & NIM =====
              Text(
                studentName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                studentId,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 8),

              // ===== DESKRIPSI MINAT =====
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Saya tertarik pada pemrograman mobile karena ingin belajar membuat aplikasi yang menarik, interaktif, dan bermanfaat bagi pengguna.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 12),

              // ===== ICON + TEKS =====
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone_android, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text('Mahasiswa Pendidikan Teknik Informatika'),
                ],
              ),

              const SizedBox(height: 30),

              // ===== STATISTIK: Row of Columns m=====
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '8',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text('Widget'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '4',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      Text('Layout'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text('State'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}