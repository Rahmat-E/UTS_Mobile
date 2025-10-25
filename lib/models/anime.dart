class Anime {
  final String id;
  final String title;
  final List<String> genres;
  final double rating;
  final int year;
  final String imageUrl;
  final String synopsis;

  Anime({
    required this.id,
    required this.title,
    required this.genres,
    required this.rating,
    required this.year,
    required this.imageUrl,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'] as String,
      title: json['title'] as String,
      genres: (json['genres'] as List).map((e) => e.toString()).toList(),
      rating: (json['rating'] as num).toDouble(),
      year: json['year'] as int,
      imageUrl: json['imageUrl'] as String,
      synopsis: json['synopsis'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genres': genres,
    'rating': rating,
    'year': year,
    'imageUrl': imageUrl,
    'synopsis': synopsis,
  };
}
