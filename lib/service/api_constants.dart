class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String popular = "movie/popular";
  static const String topRated = "movie/top_rated";
  static const String upcoming = "movie/upcoming";
  static const String nowPlaying = "movie/now_playing";
  static const String discover = "discover/movie";
  static const String search = "search/movie";
  static const String movie = "movie";


  static String movieDetails(int id) => "movie/$id";
  static String movieReviews(int id) => "movie/$id/reviews";
  static String movieCast(int id) => "movie/$id/credits";
}
