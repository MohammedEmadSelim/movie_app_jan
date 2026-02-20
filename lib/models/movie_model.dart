import 'package:hive_flutter/adapters.dart';
part 'movie_model.g.dart'; // The file that will be generated


@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final List<int> genreIds;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String originalLanguage;
  @HiveField(5)
  final String originalTitle;
  @HiveField(6)
  final String overview;
  @HiveField(7)
  final double popularity;
  @HiveField(8)
  final String? posterPath;
  @HiveField(9)
  final DateTime? releaseDate;
  @HiveField(10)
  final String title;
  @HiveField(11)
  final bool video;
  @HiveField(12)
  final double voteAverage;
  @HiveField(13)
  final int voteCount;


  const MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: (json['adult'] ?? false) as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: ((json['genre_ids'] as List?) ?? []).map((e) => (e as num).toInt()).toList(),
      id: (json['id'] ?? 0) as int,
      originalLanguage: (json['original_language'] ?? '') as String,
      originalTitle: (json['original_title'] ?? '') as String,
      overview: (json['overview'] ?? '') as String,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String?,
      releaseDate: _parseDate(json['release_date']),
      title: (json['title'] ?? '') as String,
      video: (json['video'] ?? false) as bool,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate?.toIso8601String().split('T').first,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  static DateTime? _parseDate(dynamic value) {
    final s = value?.toString().trim();
    if (s == null || s.isEmpty) return null;
    try {
      return DateTime.parse(s);
    } catch (_) {
      return null;
    }
  }
}
