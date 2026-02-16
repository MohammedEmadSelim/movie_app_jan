class ApiQuery {

    //! query parametrs for dicover model
  static Map<String, dynamic> discoverQuery = {
    "include_adult": false,
    "language": "en-US",
    "sort_by": "popularity.desc",
    "page": 1,
  };
  //! query parametrs for now playing model

  static Map<String, dynamic> nowPlayingQuery = {
    "language": "en-Us",
    "page": 1,
  };

  //! query parametrs for popular model
  static Map<String, dynamic> popularQuery = {
    "language": "en-Us",
    "page": 1,
  };
  //! query parametrs for popular model
  static Map<String, dynamic> upComingQuery = {
    "language": "en-Us",
    "page": 1,
  };
  //! query parametrs for popular model
  static Map<String, dynamic> topRatedQuery = {
    "language": "en-Us",
    "page": 1,
  };
}
