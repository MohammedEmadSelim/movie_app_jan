class MovieDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<String> genres;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });
}
