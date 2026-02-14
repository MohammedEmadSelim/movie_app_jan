// tmdb_movies_response.dart

import 'package:new_api_explain/models/movie_model.dart';

class CarouselMoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const CarouselMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CarouselMoviesResponse.fromJson(Map<String, dynamic> json) {
    return CarouselMoviesResponse(
      page: (json['page'] ?? 0) as int,
      results: ((json['results'] as List?) ?? [])
          .map((e) => MovieModel.fromJson((e as Map).cast<String, dynamic>()))
          .toList(),
      totalPages: (json['total_pages'] ?? 0) as int,
      totalResults: (json['total_results'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}

