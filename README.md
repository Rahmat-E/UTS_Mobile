**Rahmat Enomoto
230605110010
TI-A**

**AnimeList UTS**

  Aplikasi mobile sederhana berbasis Flutter untuk menampilkan daftar anime berdasarkan genre dan menandai anime favorit.
  Dibuat sebagai tugas Ujian Tengah Semester (UTS) mata kuliah Mobile Programming — Semester Ganjil 2025/2026.

**Deskripsi Singkat**

  AnimeList UTS merupakan aplikasi katalog anime yang menampilkan daftar anime berdasarkan genre tertentu.
  Aplikasi ini dikembangkan menggunakan Flutter framework dengan penerapan konsep:

  Layout dan Widget

  Navigasi antar halaman

  Pengolahan data dummy JSON lokal

  Desain antarmuka yang konsisten dan responsif

  Data yang digunakan disimpan dalam file lokal assets/anime.json, kemudian ditampilkan dalam bentuk grid dan list menggunakan widget Flutter seperti GridView, Card, dan ListView.

  

**Tujuan Pengembangan**

  Menerapkan konsep dasar Mobile Programming dengan Flutter.

  Membuat antarmuka pengguna (UI) yang bersih, interaktif, dan responsif.

  Menerapkan navigasi antar halaman menggunakan BottomNavigationBar dan Navigator.push().

  Mengolah data JSON lokal dan menampilkannya secara terstruktur.

  Menyusun struktur proyek yang siap untuk dikembangkan lebih lanjut menggunakan API.

  

** Struktur Folder Proyek**
  
             lib/
             ├─ main.dart
             ├─ models/
             │   └─ anime.dart
             ├─ pages/
             │   ├─ home_page.dart
             │   ├─ genre_page.dart
             │   ├─ detail_page.dart
             │   └─ favorite_page.dart
            assets/
             ├─ anime.json
             └─ images/
                 ├─ aot.jpg
                 ├─ bokunohero.jpg
                 ├─ chainsaw.jpg
                 ├─ demon_slayer.jpg
                 ├─ frieren.jpg
                 ├─ haikyu.jpg
                 ├─ jjk.jpg
                 ├─ kimi_no_nawa.jpg
                 ├─ mushoku.jpg
                 ├─ naruto.jpg
                 ├─ onepiece.jpg
                 └─ spy.jpg

**Fitur Aplikasi**

  Home Page	Menampilkan daftar genre dan anime terbaru dalam bentuk grid.
  Genre Page	Menampilkan daftar anime berdasarkan genre yang dipilih.
  Detail Page	Menampilkan detail anime: gambar, judul, genre, rating, tahun, dan sinopsis.
  Favorite Page	Menampilkan daftar anime yang telah ditandai favorit oleh pengguna.


