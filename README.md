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