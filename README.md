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