// File ini menampilkan daftar genre anime dan daftar anime terbaru.
// Pengguna dapat memilih genre untuk berpindah ke halaman Genre,
// atau menekan kartu anime untuk melihat detail anime tersebut.
import 'package:flutter/material.dart';
import '../models/anime.dart';

class HomePage extends StatelessWidget {
  final List<Anime> anime;
  final List<String> allGenres;
  final void Function(String) onOpenGenre;
  final void Function(Anime) onOpenDetail;

  const HomePage({
    super.key,
    required this.anime,
    required this.allGenres,
    required this.onOpenGenre,
    required this.onOpenDetail,
  });

  @override
  Widget build(BuildContext context) {
    // Jika data anime belum dimuat, tampilkan indikator loading
    if (anime.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
 // Mengurutkan anime berdasarkan tahun rilis terbaru
    final newest = [...anime]..sort((a, b) => b.year.compareTo(a.year));
    final top8 = newest.take(8).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimeList UTS'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Genre', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: allGenres.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final g = allGenres[i];
                return ActionChip(
                  label: Text(g),
                  onPressed: () => onOpenGenre(g),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text('Anime Terbaru', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),

// Grid menampilkan daftar anime terbaru
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.6,
            ),
            itemCount: top8.length,
            itemBuilder: (context, i) {
              final a = top8[i];
              return _AnimeCard(anime: a, onTap: () => onOpenDetail(a));
            },
          ),
        ],
      ),
    );
  }
}

class _AnimeCard extends StatelessWidget {
  final Anime anime;
  final VoidCallback onTap;

  const _AnimeCard({required this.anime, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                anime.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const ColoredBox(
                  color: Colors.black12,
                  child: Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star_rate_rounded,
                          color: Colors.amber, size: 16),
                      Text(anime.rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 6),
                      Text('${anime.year}',
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

