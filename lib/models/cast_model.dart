class CastModel {
  final int id;
  final String name;
  final String image;
  final String character;

  CastModel({
    required this.id,
    required this.name,
    required this.image,
    required this.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'],
      image: json['profile_path'] ?? "",
      character: json['character'] ?? "",
    );
  }
}