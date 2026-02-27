class MovieModel{
final int id ;
final String title;
final String image;
final double rate;
final String release;
final String overview;
final String backdrop;



MovieModel({
  required this.id,
  required this.title,
  required this.image,
  this.rate = 0.0,
  this.release = '',
  this.overview = '',
  this.backdrop = '',
  });
  factory MovieModel.fromJson(Map<String, dynamic> json){
    if (json != null){
      return MovieModel(
          id: json['id']?? 0,
          title: json['title'] ?? '',
          image: json['poster_path'] ?? '',
          rate: json['vote_average']?.toDouble() ?? 0.0,
          release: json['release_date'] ?? '',
          overview: json['overview'] ?? '',
          backdrop: json['backdrop_path'] ?? '',


      );
    }

  }
}