class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<GenreModel> genres;
  final double voteAverage;
  final int runtime;
  final String releaseDate;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.genres,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      genres: (json['genres'] as List<dynamic>? ?? [])
          .map((e) => GenreModel.fromJson(e))
          .toList(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      releaseDate: json['release_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'genres': genres.map((e) => e.toJson()).toList(),
      'vote_average': voteAverage,
      'runtime': runtime,
      'release_date': releaseDate,
    };
  }
}class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}