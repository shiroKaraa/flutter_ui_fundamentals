import 'package:flutter/material.dart';

const String studentName = 'I Kadek Dwi Bajaskara';
const String studentId = '2415051068';

void main() {
  runApp(const MyApp());
}

Widget buildStatCard(String value, String label, Color color, IconData icon) {
  return Column(
    children: [
      Icon(icon, color: color, size: 24),
      const SizedBox(height: 4),
      Text(
        value,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 13)),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF8F5FF),
        appBar: AppBar(
          title: const Text('Flutter UI Fundamentals'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ===== FOTO PROFIL =====
                const CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.deepPurple,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(height: 20),

                // ===== CARD IDENTITAS =====
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$studentId - $studentName',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Flutter UI Fundamentals',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ===== CONTAINER DESKRIPSI =====
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.deepPurple.withOpacity(0.25),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'Saya tertarik pada pemrograman mobile karena ingin belajar membuat aplikasi yang menarik, interaktif, dan bermanfaat bagi pengguna.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ===== ICON + TEKS =====
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android,
                        color: Colors.deepPurple, size: 22),
                    SizedBox(width: 8),
                    Text(
                      'Mahasiswa Pendidikan Teknik Informatika',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ===== STATISTIK =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStatCard('8', 'Widget', Colors.redAccent, Icons.widgets),
                    buildStatCard('4', 'Layout', Colors.amber, Icons.dashboard),
                    buildStatCard('1', 'State', Colors.green, Icons.memory),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}