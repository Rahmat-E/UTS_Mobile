import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/anime.dart';

class AnimeRepository {
  static Future<List<Anime>> load() async {
    final raw = await rootBundle.loadString('assets/anime.json');
    final data = jsonDecode(raw) as List<dynamic>;
    return data.map((e) => Anime.fromJson(e as Map<String, dynamic>)).toList();
  }
}
