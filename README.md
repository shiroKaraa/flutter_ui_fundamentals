Tahap 2 :
Ukuran Font Saya coba rubah dari 20 menjadi 10 , Dan terlihat hasil nya saat di reload ukuran dari nama dan nim berubah menjadi lebih kecil 

Tahap 3 :
Asset berhasil didaftarkan. flutter pub get sukses tanpa error. Folder assets/images/ dan assets/data/ sudah dikenali project.

Tahap 4 :
Widget tree versi Anda: 
MaterialApp
└─ Scaffold
   ├─ AppBar
   │  └─ Text('Flutter UI Fundamentals')
   │
   └─ Body: Center
      └─ Column
         ├─ Text (identitas)
         ├─ SizedBox(height: 13)
         ├─ Text (judul)
         ├─ SizedBox(height: 12)
         └─ Image.asset
            ├─ width: 60
            └─ height: 60

child dipakai untuk 1 anak, children untuk banyak. mainAxisAlignment mengatur posisi sepanjang sumbu utama (vertikal untuk Column), crossAxisAlignment sepanjang sumbu silang (horizontal untuk Column).

Tahap 5 :

COBA: Eksperimen  Bandingkan Image.asset dengan CircleAvatar. Manakah yang lebih sesuai untuk foto profil? Jelaskan satu kalimat.

Jawaban: CircleAvatar lebih sesuai untuk foto profil karena otomatis memotong gambar menjadi bentuk bulat dan menyediakan placeholder background jika gambar gagal dimuat. Image.asset menampilkan gambar apa adanya (persegi), sehingga untuk membuatnya bulat perlu ClipOval atau BoxDecoration secara manual. CircleAvatar juga lebih ringkas dan konsisten dengan Material Design.

CircleAvatar dipakai untuk foto profil bulat — lebih praktis daripada Image.asset yang perlu styling manual. Icon untuk ikon Material singkat. Text untuk teks dengan TextStyle untuk styling. Ketiganya bisa digabung dalam Column dan Row. Jika foto tidak tersedia, Icon(Icons.person) jadi fallback yang aman.

Tahap 6 :

-	Row → digunakan untuk menyusun widget secara horizontal, sedangkan sumbu silangnya vertikal. 
-	Column → digunakan untuk menyusun widget secara vertikal, sedangkan sumbu silangnya horizontal. 
-	mainAxisAlignment → digunakan untuk mengatur posisi widget pada sumbu utama. 
-	crossAxisAlignment → digunakan untuk mengatur posisi widget pada sumbu silang. 
-	Bisa disarangkan → Row dapat berisi beberapa Column, misalnya untuk membuat 3 bagian statistik yang tersusun sejajar.


Tahap 7 :

Card mengelompokkan informasi dan memberikan elevation (bayangan) dan sudut melengkung dengan RoundedRectangleBorder. Padding memberi jarak dalam, sedangkan margin (di Container) memberi jarak luar. Container + BoxDecoration dipakai untuk membuat elemen ringkasan dengan background & border kustom. SizedBox menjaga jarak antar bagian tetap konsisten.

Tahap 8 :

Reusable widget mengurangi duplikasi kode. buildStatCard dipanggil 3× dengan data berbeda (value, label, warna), tapi kode hanya ditulis sekali. Kalau perlu ubah styling, cukup edit function-nya saja. NIM + Nama tetap tampil di halaman utama.

Tahap 9 :

StatefulWidget dipakai untuk UI yang berubah karena interaksi user. TextEditingController menangkap input, setState() memicu rebuild, dan dispose() membersihkan controller. Ini contoh nyata hubungan Dart (String, method, callback) dengan Flutter 

Tahap 10 :

Column + Expanded dipakai agar identitas tetap tampil di atas daftar. Expanded memberi tinggi terbatas ke ListView sehingga bisa scroll sendiri tanpa shrinkWrap. GreetingCard dipindah jadi item pertama list agar tidak mengganggu scroll. Struktur ini adalah pola umum di Flutter: header fixed + konten scrollable.

Tahap 11 :

Penggunaan where((item) => item['done'] == true).length efektif untuk menghitung item selesai dari List<Map<String, dynamic>>. Menambahkan trailing pada ListTile membuat status lebih eksplisit (teks + warna). Menggabungkan Row + spaceBetween untuk judul dan ringkasan membuat header list lebih informatif tanpa mengganggu layout Column + Expanded.

Tahap 12 :

Function loadStudentData() menggunakan rootBundle.loadString() untuk membaca file dari asset bundle, lalu jsonDecode() mengubah String JSON menjadi Map<String, dynamic>. WidgetsFlutterBinding.ensureInitialized() diperlukan sebelum await di main() agar binding Flutter siap. JSON berhasil dibaca dan menampilkan 5 courses. Error umum: Unable to load asset → cek registrasi pubspec.yaml + jalankan flutter pub get; FormatException → cek tanda petik/koma/kurung JSON.

Tahap 13 :

FutureBuilder menghubungkan Future dari Dart dengan UI Flutter secara declaratif. late memungkinkan deklarasi studentFuture tanpa nilai awal, dan diisi di initState() sebelum build() pertama. Future wajib dibuat di initState(), bukan build(), agar tidak reload berulang. Tiga state wajib: waiting → CircularProgressIndicator, hasError → Text pesan error, data → render student & courses ke UI. Data kini berasal dari assets/data/student_data.json (bukan hardcode). Ringkasan dihitung dari JSON: courses.where((c) => c['status'] == 'done').length.

Tahap 14 :

Tahap 14 merupakan pengembangan dari Tahap 1–13, bukan aplikasi baru.

Saya menambahkan Mini Quiz Akademik karena setelah membuat dashboard Tahap 14 saya merasa kontennya masih terlalu sedikit dan monoton, sehingga saya ingin dashboard lebih interaktif; Mini Quiz saya buat sebagai MiniQuizCard berisi 5 soal Dart/Flutter dengan feedback dan skor akhir, yang sekaligus memperkuat kembali konsep StatefulWidget dan setState() dari Tahap 9, dan data soalnya saya pisah ke lib/quiz_data.dart agar widget tetap ramping dan mudah dikembangkan.

Widget Tree Target
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text('Learning Dashboard')
    │
    └── SafeArea
        └── FutureBuilder<Map<String, dynamic>>
            │
            ├── [waiting]  →  Center → CircularProgressIndicator
            │
            ├── [hasError] →  Center → Padding → Text('Gagal memuat data: ...')
            │
            └── [data]     →  Column
                │
                ├── Padding                        ← FIXED (di luar scroll)
                │   └── Container                  ← Compact Identity Card
                │       └── Row
                │           ├── CircleAvatar
                │           │   └── ClipOval
                │           │       └── Image.asset (errorBuilder → Icon)
                │           │
                │           └── Expanded
                │               └── Column
                │                   ├── Text(name)
                │                   ├── Text('NIM: ...')
                │                   └── Text('Program • Semester ...')
                │
                └── Expanded                       ← SCROLLABLE
                    └── ListView.builder
                        │
                        ├── [index 0] Summary Cards
                        │   └── Padding → Row
                        │       ├── buildStatCard('Total Topik')
                        │       ├── buildStatCard('Selesai')
                        │       └── buildStatCard('Progress')
                        │
                        ├── [index 1] Learning Goal
                        │   └── Padding → Column
                        │       ├── sectionTitle('Learning Goal')
                        │       └── Container → Row
                        │           ├── Icon(Icons.flag_outlined)
                        │           └── Expanded → Text(learningGoal)
                        │
                        ├── [index 2] GreetingCard
                        │   └── Card
                        │       └── Padding → Column
                        │           ├── Row (Icon + 'Latihan Interaksi')
                        │           ├── Text(NIM - Nama)
                        │           ├── TextField (controller)
                        │           ├── ElevatedButton.icon
                        │           └── Container → Text(message)
                        │
                        ├── [index 3] MiniQuizCard
                        │   └── Card
                        │       └── Padding → Column
                        │           ├── Row (Icon + 'Mini Quiz Akademik')
                        │           │
                        │           ├── if (finished)
                        │           │   └── _buildHasil()
                        │           │       ├── Text('Skor kamu: x / 5')
                        │           │       ├── Text('Nilai: xx')
                        │           │       └── ElevatedButton.icon (Ulangi Quiz)
                        │           │
                        │           └── else
                        │               └── _buildSoal()
                        │                   ├── Text(pertanyaan)
                        │                   ├── ...options.map() → InkWell → Container
                        │                   │       ├── Icon (benar/salah/netral)
                        │                   │       └── Text(opsi)
                        │                   └── TextButton.icon ('Soal Berikutnya')
                        │
                        ├── [index 4] Judul Daftar Materi
                        │   └── Padding → Row
                        │       ├── sectionTitle('Daftar Materi')
                        │       └── Text('x dari y selesai')
                        │
                        └── [index 5..N] Course Item (10×)
                            └── _buildCourseCard()
                                └── Card
                                    └── Padding → Row
                                        ├── Icon (status)
                                        ├── Expanded → Column
                                        │   ├── Text(title)
                                        │   ├── Text('code • credits SKS')
                                        │   ├── Text(description)
                                        │   └── Text('Dosen: ...')
                                        └── _statusBadge(status)

Tree File Project
flutter_ui_fundamentals/
│
├── lib/
│   ├── main.dart                 ← UI utama + DashboardPage + GreetingCard + MiniQuizCard
│   └── quiz_data.dart            ← data soal Mini Quiz (const list)
│
├── assets/
│   ├── images/
│   │   └── profile.jpg           ← foto profil (dipakai Image.asset + errorBuilder)
│   └── data/
│       └── student_data.json     ← student, learning_goal, courses (10 item)
├── pubspec.yaml                  ← registrasi asset & dependency

DEBUG — Uji Fallback Asset (errorBuilder) :

Tujuan uji: Memastikan errorBuilder pada Image.asset bekerja sesuai rencana, yaitu aplikasi tidak crash dan otomatis menampilkan icon default (Icons.person) saat file profile.jpg gagal dimuat.

Skenario uji: Saya sengaja me-rename file assets/images/profile.jpg → profiles.jpg (atau menghapusnya sementara), lalu melakukan hot restart (R) untuk memicu ulang pembacaan asset.

Gejala error yang muncul di terminal:
Could not update files on device: PathNotFoundException: Cannot open file,
path = 'D:\...\flutter_ui_fundamentalss\assets\images\Profile.jpg'
(OS Error: The system cannot find the file specified, errno = 2)

Could not update files on device: PathNotFoundException: Cannot open file,
path = 'D:\...\flutter_ui_fundamentalss\assets\images\profile.jpg'
(OS Error: The system cannot find the file specified, errno = 2)

Pesan ini muncul dua kali karena Flutter mencoba membaca file dengan dua nama berbeda (Profile.jpg dan profile.jpg) — keduanya tidak ditemukan karena file fisiknya memang sudah di-rename.

Penyebab:
1. File fisik profile.jpg benar-benar tidak ada di folder assets/images/ (karena di-rename).
2. pubspec.yaml sebelumnya juga mendaftarkan file individual - assets/images/profile.jpg — baris ini tidak perlu dan justru membuat proses pencarian lebih kaku.
3. Perbedaan huruf besar/kecil: Profile.jpg vs profile.jpg — Flutter asset loader bersifat case-sensitive, jadi kedua nama dianggap file berbeda.

Perbaikan yang dilakukan:
1. pubspec.yaml disederhanakan — cukup daftarkan folder, bukan file individual:
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/data/
    - assets/images/profile.jpg <- Saya Hapus 
2. Jalankan flutter clean + flutter pub get + hot restart (R) agar asset di-bundle ulang.

Hasil uji:
✅ errorBuilder bekerja dengan menampilkan Icon(Icons.person) berwarna biru di dalam CircleAvatar saat saya Merubah nama gambar dari profile.jpg -> profiles.jpg
✅ Nama, NIM, dan seluruh konten dashboard lainnya tetap tampil normal.
✅ Setelah nama file profiles.jpg dikembalikan Menjadi profile.jpg dan hot restart (R), foto profil muncul kembali tanpa error.

Tahap 15 :

Dari debugging ini saya belajar tiga hal: (1) RenderFlex Overflow diatasi dengan Expanded + overflow: TextOverflow.ellipsis; (2) Asset tidak ditemukan diatasi dengan memastikan file fisik ada, pubspec.yaml hanya mendaftarkan folder, nama file konsisten huruf kecil, lalu flutter clean + pub get + hot restart (R), dan saya memakai Image.asset(... errorBuilder ...) agar aplikasi tetap tampil Icon(Icons.person) tanpa crash; (3) error state pada FutureBuilder dan null-safety (as String? ?? 'default') wajib ada agar aplikasi tetap stabil meski asset atau JSON bermasalah.

Tahap 16 :

Saya menginisialisasi repository GitHub sejak Tahap 1 dan melakukan commit + push di setiap tahap pengerjaan, sehingga riwayat Git saya tersusun rapi dari Tahap 1 hingga Tahap 15 : DEBUG — total 17 commit dengan pesan yang bermakna dan mencerminkan progres alami praktikum. Setiap tahap saya beri pesan commit yang menjelaskan fokusnya (mis. Tahap 10 untuk collection list, Tahap 12 untuk JSON statik, Tahap 14 : Mini Project Integrasi: Learning Dashboard untuk integrasi final), dan pada beberapa tahap saya juga membuat commit tambahan seperti Tahap 1 Eksperimen dan Tahap 5 Revisi untuk merekam percobaan/revisi. Dengan pola ini, dosen dapat meninjau proses pengerjaan, bukan hanya hasil akhir — misalnya dapat melihat kapan FutureBuilder mulai dipakai (Tahap 13), kapan Mini Quiz ditambahkan (Tahap 14), dan bagaimana debugging dilakukan (Tahap 15). Saya juga memastikan .gitignore sudah mengecualikan folder build/ dan .dart_tool/ agar repository tetap bersih, serta tidak ada file sensitif (credential, keystore) yang ter-commit. Semua commit sudah di-push ke branch main dan hash commit terakhir (313ba72) tercatat sebagai checkpoint final praktikum ini.

