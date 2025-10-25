import 'package:flutter/material.dart';
import 'models/anime.dart';
import 'services/anime_repository.dart';
import 'pages/home_page.dart';
import 'pages/genre_page.dart';
import 'pages/detail_page.dart';
import 'pages/favorites_page.dart';

void main() {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimeList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3B82F6),
        brightness: Brightness.dark,
      ),
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int index = 0;
  List<Anime> all = [];
  String selectedGenre = 'Action';
  final Set<String> favIds = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await AnimeRepository.load();
    setState(() => all = data);
  }

  List<String> get allGenres {
    final s = <String>{};
    for (final a in all) {
      s.addAll(a.genres);
    }
    final list = s.toList()..sort();
    return list;
  }

  void openDetail(Anime a) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => DetailPage(
        anime: a,
        isFavorite: favIds.contains(a.id),
        onToggleFavorite: () {
          setState(() {
            if (favIds.contains(a.id)) {
              favIds.remove(a.id);
            } else {
              favIds.add(a.id);
            }
          });
          Navigator.of(context).pop();
          openDetail(a);
        },
      ),
    ));
  }

  void openGenre(String g) {
    setState(() {
      selectedGenre = g;
      index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        anime: all,
        allGenres: allGenres,
        onOpenGenre: openGenre,
        onOpenDetail: openDetail,
      ),
      GenrePage(
        allAnime: all,
        allGenres: allGenres.isEmpty ? ['Action'] : allGenres,
        initialGenre: selectedGenre,
        onOpenDetail: openDetail,
      ),
      FavoritesPage(
        favorites: all.where((a) => favIds.contains(a.id)).toList(),
        onOpenDetail: openDetail,
      ),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Genre'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
