class MovieEntity {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  final String? genre;
  final int? runtime;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    this.genre,
    this.runtime,
  });

  MovieEntity copyWith({String? genre, int? runtime}) {
    return MovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      genre: genre ?? this.genre,
      runtime: runtime ?? this.runtime,
    );
  }
}
