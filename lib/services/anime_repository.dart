// mengonversi data dari file JSON lokal (assets/anime.json)
// menjadi daftar objek Anime agar bisa digunakan di seluruh aplikasi.
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/anime.dart';
// Kelas AnimeRepository digunakan untuk mengambil data anime
// dari file lokal menggunakan rootBundle (fungsi bawaan Flutter)
class AnimeRepository {
  static Future<List<Anime>> load() async {
    final raw = await rootBundle.loadString('assets/anime.json');
    final data = jsonDecode(raw) as List<dynamic>;
    return data.map((e) => Anime.fromJson(e as Map<String, dynamic>)).toList();
  }
}

