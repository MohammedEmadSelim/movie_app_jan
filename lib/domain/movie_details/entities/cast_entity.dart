class CastEntity {
  final int id;
  final String name;
  final String? profilePath;
  final String character;

  CastEntity({
    required this.id,
    required this.name,
    this.profilePath,
    required this.character,
  });
}
