class MovieModel{
final int id ;
final String title;
final String image;

MovieModel({
  required this.id,
  required this.title,
  required this.image
  });
  factory MovieModel.fromJson(Map<String, dynamic> json){
    if (json != null){
      return MovieModel(
          id: json['id'],
          title: json['title'] ?? '',
          image: json['poster_path'] ?? ''
      );
    }

  }
}