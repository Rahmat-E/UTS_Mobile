import 'package:flutter/material.dart';
import '../models/anime.dart';

class GenrePage extends StatefulWidget {
  final List<Anime> allAnime;
  final List<String> allGenres;
  final String initialGenre;
  final void Function(Anime) onOpenDetail;

  const GenrePage({
    super.key,
    required this.allAnime,
    required this.allGenres,
    required this.initialGenre,
    required this.onOpenDetail,
  });

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialGenre;
  }

  @override
  Widget build(BuildContext context) {
    final filtered =
    widget.allAnime.where((a) => a.genres.contains(selected)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori / Genre'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButtonFormField<String>(
              value: selected,
              decoration: const InputDecoration(
                labelText: 'Pilih Genre',
                border: OutlineInputBorder(),
              ),
              items: widget.allGenres
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (v) => setState(() => selected = v!),
            ),
          ),


          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Tidak ada anime di genre ini.'))
                : GridView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final a = filtered[i];
                return _GenreAnimeCard(
                  anime: a,
                  onTap: () => widget.onOpenDetail(a),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class _GenreAnimeCard extends StatelessWidget {
  final Anime anime;
  final VoidCallback onTap;

  const _GenreAnimeCard({required this.anime, required this.onTap});

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
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.broken_image_outlined,
                      color: Colors.grey, size: 40),
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
                      Text(
                        '${anime.year}',
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12),
                      ),
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
