import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show Dio, Options;
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie_details_model.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());


  Future<void>getDetails( String movieId)async{
    emit(MovieDetailsLoading ());
    var dio =Dio();
    try {
      final res = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
        options: Options(
          headers: {
            'Authorization': 'Bearer YOUR_BEARER_TOKEN_HERE',
            'Accept': 'application/json',
          },
        ),
      );
      emit( MovieDetailsSuccess(MovieDetailsModel.fromJson( res.data)));
      print("statusCode is  ===>${res.statusCode}");
      print("data is  ===>${res.data}");
    } catch (e) {
      emit(MovieDetailsFailure(e.toString()));
      print("Error: $e");
}
  }
}
