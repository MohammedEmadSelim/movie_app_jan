import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';

class ReviewModel {
  final String id;
  final String author;
  final String content;
  final String? avatarPath;
  final double? rating;

  ReviewModel({
    required this.id,
    required this.author,
    required this.content,
    this.avatarPath,
    this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      avatarPath: json['author_details']?['avatar_path'],
      rating: (json['author_details']?['rating'] as num?)?.toDouble(),
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      author: author,
      content: content,
      avatarPath: avatarPath,
      rating: rating,
    );
  }
}
