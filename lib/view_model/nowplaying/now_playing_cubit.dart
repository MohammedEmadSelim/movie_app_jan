import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/nowPlaying/nowplaying_model.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  Future<void> getNowPlayingMovie()async{
    emit(NowPlayingLoading());
    try{
      var dio =Dio();
      var nowPlay = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
            "accept":"application/json"
          }
        )
      );
      final nowPlayingMovie = NowPlayingModel.fromJson(nowPlay.data);
      emit(NowPlayingSuccess(nowPlayingMovie));
    }catch(e){
      emit(NowPlayingError(e.toString()));
    }
  }
}
