class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTimeInSeconds;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTimeInSeconds,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTimeInSeconds: (json['totalTimeInSeconds'] / 60) as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
