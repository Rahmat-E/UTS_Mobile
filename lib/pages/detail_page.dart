// File ini menampilkan informasi detail mengenai satu anime
import 'package:flutter/material.dart';
import '../models/anime.dart';
// Menerima objek Anime, status favorit, dan fungsi toggle favorit.
class DetailPage extends StatelessWidget {
  final Anime anime;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const DetailPage({
    super.key,
    required this.anime,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                anime.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    anime.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.broken_image_outlined,
                          color: Colors.grey, size: 60),
                    ),
                  ),

                  Container(color: Colors.black26),
                ],
              ),
            ),
            // Tombol favorit di pojok kanan atas
            actions: [
              IconButton(
                onPressed: onToggleFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Baris Genre Anime
                  Row(
                    children: [
                      const Icon(Icons.local_movies_rounded, size: 20),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          anime.genres.join(' • '),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                   // Rating dan Tahun Rilis

                  Row(
                    children: [
                      const Icon(Icons.star_rate_rounded,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 6),
                      Text('${anime.rating.toStringAsFixed(1)} / 10'),
                      const SizedBox(width: 12),
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 6),
                      Text('${anime.year}'),
                    ],
                  ),

                  const SizedBox(height: 16),

                      // Sinopsis Anime 
                  const Text(
                    'Sinopsis',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    anime.synopsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(height: 1.4),
                  ),

                  const SizedBox(height: 24),
                  // Tombol Favorite
                  Center(
                    child: FilledButton.icon(
                      onPressed: onToggleFavorite,
                      icon: Icon(isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      label: Text(isFavorite
                          ? 'Hapus dari Favorit'
                          : 'Tambah ke Favorit'),
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

