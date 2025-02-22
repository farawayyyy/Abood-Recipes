class Recipe {
  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final double rating;
  final int ratingCount;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.rating,
    required this.ratingCount,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '0',
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? 'No Description',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      rating: json['user_ratings'] != null
          ? (json['user_ratings']['score'] ?? 0.0)
          : 0.0,
      ratingCount: json['user_ratings'] != null
          ? (json['user_ratings']['count'] ?? 0)
          : 0,
    );
  }
}
