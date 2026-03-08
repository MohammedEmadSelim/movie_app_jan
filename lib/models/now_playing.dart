// tmdb_now_playing_response.dart


import 'movie_model.dart';

class TmdbNowPlayingResponse {
  final DatesRange dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const TmdbNowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TmdbNowPlayingResponse.fromJson(Map<String, dynamic> json) {
    return TmdbNowPlayingResponse(
      dates: DatesRange.fromJson((json['dates'] as Map?)?.cast<String, dynamic>() ?? const {}),
      page: (json['page'] ?? 0) as int,
      results: ((json['results'] as List?) ?? [])
          .map((e) => MovieModel.fromJson((e as Map).cast<String, dynamic>()))
          .toList(),
      totalPages: (json['total_pages'] ?? 0) as int,
      totalResults: (json['total_results'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'dates': dates.toJson(),
    'page': page,
    'results': results.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}

class DatesRange {
  final DateTime? maximum;
  final DateTime? minimum;

  const DatesRange({required this.maximum, required this.minimum});

  factory DatesRange.fromJson(Map<String, dynamic> json) {
    return DatesRange(
      maximum: _parseDate(json['maximum']),
      minimum: _parseDate(json['minimum']),
    );
  }

  Map<String, dynamic> toJson() => {
    'maximum': maximum?.toIso8601String().split('T').first,
    'minimum': minimum?.toIso8601String().split('T').first,
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

