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
              // Opsi A: pakai foto (pastikan file ada di assets/images/profile.jpg)
              const CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),

              // Opsi B: kalau TIDAK punya foto, comment Opsi A di atas,
              // lalu uncomment 3 baris di bawah ini:
              // const CircleAvatar(
              //   radius: 46,
              //   child: Icon(Icons.person, size: 46),
              // ),

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
                  'Tertarik pada pengembangan aplikasi mobile '
                  'dan UI yang bersih serta responsif.',
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
                  Text('Mobile Programming Student'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}