class ReviewEntity {
  final String id;
  final String author;
  final String content;
  final String? avatarPath;
  final double? rating;

  ReviewEntity({
    required this.id,
    required this.author,
    required this.content,
    this.avatarPath,
    this.rating,
  });
}
