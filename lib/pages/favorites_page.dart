import 'package:flutter/material.dart';
import '../models/anime.dart';
// Menerima daftar anime favorit dan fungsi navigasi ke halaman detail.
class FavoritesPage extends StatelessWidget {
  final List<Anime> favorites;
  final void Function(Anime) onOpenDetail;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onOpenDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
      // Jika belum ada anime favorit, tampilkan teks pemberitahuan
          ? const Center(child: Text('Belum ada anime favorit.'))
      // Jika sudah ada, tampilkan dalam bentuk daftar (ListView)
          : ListView.builder(   
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        itemBuilder: (context, i) {
          final a = favorites[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onOpenDetail(a),
              child: Row(
                children: [
                  // Gambar Anime Favorit
                  SizedBox(
                    height: 100,
                    width: 80,
                    child: Image.asset(
                      a.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.broken_image_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                     // Informasi Anime (Teks)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          a.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          a.genres.join(' • '),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star_rate_rounded,
                                color: Colors.amber, size: 16),
                            Text(a.rating.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

