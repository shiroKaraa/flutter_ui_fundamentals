import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

const String studentName = 'I Kadek Dwi Bajaskara';
const String studentId = '2415051068';

// ===== FUNCTION PEMBACA JSON (TAHAP 12) =====
Future<Map<String, dynamic>> loadStudentData() async {
  final jsonString = await rootBundle.loadString(
    'assets/data/student_data.json',
  );
  return jsonDecode(jsonString) as Map<String, dynamic>;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ===== UJI COBA JSON (TAHAP 12) =====
  final data = await loadStudentData();
  debugPrint('===== DATA JSON =====');
  debugPrint('Student: ${data['student']}');
  debugPrint('Jumlah courses: ${(data['courses'] as List).length}');
  debugPrint('Course pertama: ${(data['courses'] as List).first}');
  debugPrint('=====================');

  runApp(const MyApp());
}

// REUSABLE WIDGET: Kartu Statistik
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

// STATEFUL WIDGET: GreetingCard
class GreetingCard extends StatefulWidget {
  const GreetingCard({super.key});

  @override
  State<GreetingCard> createState() => _GreetingCardState();
}

class _GreetingCardState extends State<GreetingCard> {
  final TextEditingController controller = TextEditingController();
  String message = 'Belum ada pesan';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _tampilkanPesan() {
    setState(() {
      message = controller.text.trim().isEmpty
          ? 'Input masih kosong'
          : controller.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Latihan Interaksi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$studentId - $studentName',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Tulis pesan...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _tampilkanPesan,
              icon: const Icon(Icons.send),
              label: const Text('Tampilkan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== COLLECTION DART (masih dipakai di UI, akan diganti JSON di Tahap 13) =====
    final List<Map<String, dynamic>> topics = [
      {
        'title': 'Git & GitHub',
        'subtitle': 'Version control',
        'done': true,
      },
      {
        'title': 'Dart Fundamentals',
        'subtitle': 'Language basics',
        'done': true,
      },
      {
        'title': 'Flutter UI Fundamentals',
        'subtitle': 'Widgets & layout',
        'done': false,
      },
      {
        'title': '$studentId - $studentName',
        'subtitle': 'Pemilik aplikasi',
        'done': false,
      },
    ];

    final int completed =
        topics.where((item) => item['done'] == true).length;

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

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.deepPurple,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
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
                        const SizedBox(height: 4),
                        const Text(
                          'Flutter UI Fundamentals',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
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
                      fontSize: 13,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android,
                        color: Colors.deepPurple, size: 20),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Mahasiswa Pendidikan Teknik Informatika',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStatCard(
                        '8', 'Widget', Colors.redAccent, Icons.widgets),
                    buildStatCard(
                        '4', 'Layout', Colors.amber, Icons.dashboard),
                    buildStatCard(
                        '1', 'State', Colors.green, Icons.memory),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daftar Topik',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '$completed dari ${topics.length} topik selesai',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: GreetingCard(),
                        );
                      }
                      final item = topics[index - 1];
                      final done = item['done'] as bool;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 6),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(
                            done ? Icons.check_circle : Icons.schedule,
                            color: done ? Colors.green : Colors.orange,
                          ),
                          title: Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(item['subtitle'] as String),
                          trailing: Text(
                            done ? 'Selesai' : 'Belum',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: done ? Colors.green : Colors.orange,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}