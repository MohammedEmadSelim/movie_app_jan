// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:movies_station_app/core/di/register_module.dart' as _i833;
import 'package:movies_station_app/core/network/api_service.dart' as _i267;
import 'package:movies_station_app/core/network/dio_client.dart' as _i972;
import 'package:movies_station_app/data/movie_details/data_source/movie_details_remote_data_source.dart'
    as _i1021;
import 'package:movies_station_app/data/movie_details/data_source/movie_details_remote_data_source_impl.dart'
    as _i288;
import 'package:movies_station_app/data/movie_details/repositories/movie_details_repo_impl.dart'
    as _i587;
import 'package:movies_station_app/data/movies/data_source/movie_remote_data_source.dart'
    as _i334;
import 'package:movies_station_app/data/movies/data_source/movie_remote_data_source_impl.dart'
    as _i258;
import 'package:movies_station_app/data/movies/repositories/movies_repo_impl.dart'
    as _i832;
import 'package:movies_station_app/domain/movie_details/repositories/movie_details_repo.dart'
    as _i990;
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_cast_use_case.dart'
    as _i416;
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_details_use_case.dart'
    as _i1035;
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_reviews_use_case.dart'
    as _i346;
import 'package:movies_station_app/domain/movies/repositories/movies_repo.dart'
    as _i1039;
import 'package:movies_station_app/domain/movies/use_cases/get_now_playing_movies_use_case.dart'
    as _i616;
import 'package:movies_station_app/domain/movies/use_cases/get_popular_movies_use_case.dart'
    as _i810;
import 'package:movies_station_app/domain/movies/use_cases/get_top_rated_movies_use_case.dart'
    as _i321;
import 'package:movies_station_app/domain/movies/use_cases/get_upcoming_movies_use_case.dart'
    as _i152;
import 'package:movies_station_app/domain/movies/use_cases/search_movies_use_case.dart'
    as _i731;
import 'package:movies_station_app/presentation/home/cubit/movies_cubit.dart' as _i564;
import 'package:movies_station_app/presentation/home/cubit/search_cubit.dart' as _i730;
import 'package:movies_station_app/presentation/home/cubit/watch_list_cubit.dart'
    as _i592;
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_cubit.dart'
    as _i862;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<String>(() => registerModule.tmdbToken);
    gh.lazySingleton<_i972.DioClient>(() => _i972.DioClient(gh<String>()));
    gh.lazySingleton<_i267.ApiService>(
      () => _i267.ApiService(gh<_i972.DioClient>()),
    );
    gh.lazySingleton<_i334.MoviesRemoteDataSource>(
      () => _i258.MoviesRemoteDataSourceImpl(gh<_i267.ApiService>()),
    );
    gh.lazySingleton<_i1021.MovieDetailsRemoteDataSource>(
      () => _i288.MovieDetailsRemoteDataSourceImpl(gh<_i267.ApiService>()),
    );
    gh.lazySingleton<_i1039.MoviesRepo>(
      () => _i832.MoviesRepoImpl(gh<_i334.MoviesRemoteDataSource>()),
    );
    gh.lazySingleton<_i990.MovieDetailsRepo>(
      () =>
          _i587.MovieDetailsRepoImpl(gh<_i1021.MovieDetailsRemoteDataSource>()),
    );
    gh.factory<_i731.SearchMoviesUseCase>(
      () => _i731.SearchMoviesUseCase(gh<_i1039.MoviesRepo>()),
    );
    gh.lazySingleton<_i616.GetNowPLayingMoviesUseCase>(
      () => _i616.GetNowPLayingMoviesUseCase(gh<_i1039.MoviesRepo>()),
    );
    gh.lazySingleton<_i810.GetPopularMoviesUseCase>(
      () => _i810.GetPopularMoviesUseCase(gh<_i1039.MoviesRepo>()),
    );
    gh.lazySingleton<_i321.GetTopRatedMoviesUseCase>(
      () => _i321.GetTopRatedMoviesUseCase(gh<_i1039.MoviesRepo>()),
    );
    gh.lazySingleton<_i152.GetUpComingMoviesUseCase>(
      () => _i152.GetUpComingMoviesUseCase(gh<_i1039.MoviesRepo>()),
    );
    gh.lazySingleton<_i416.GetMovieCastUseCase>(
      () => _i416.GetMovieCastUseCase(gh<_i990.MovieDetailsRepo>()),
    );
    gh.lazySingleton<_i1035.GetMovieDetailsUseCase>(
      () => _i1035.GetMovieDetailsUseCase(gh<_i990.MovieDetailsRepo>()),
    );
    gh.lazySingleton<_i346.GetMovieReviewsUseCase>(
      () => _i346.GetMovieReviewsUseCase(gh<_i990.MovieDetailsRepo>()),
    );
    gh.lazySingleton<_i592.WatchListCubit>(
      () => _i592.WatchListCubit(gh<_i1035.GetMovieDetailsUseCase>()),
    );
    gh.factory<_i564.MoviesCubit>(
      () => _i564.MoviesCubit(
        gh<_i616.GetNowPLayingMoviesUseCase>(),
        gh<_i152.GetUpComingMoviesUseCase>(),
        gh<_i321.GetTopRatedMoviesUseCase>(),
        gh<_i810.GetPopularMoviesUseCase>(),
      ),
    );
    gh.factory<_i862.MovieDetailsCubit>(
      () => _i862.MovieDetailsCubit(
        gh<_i346.GetMovieReviewsUseCase>(),
        gh<_i416.GetMovieCastUseCase>(),
        gh<_i1035.GetMovieDetailsUseCase>(),
      ),
    );
    gh.factory<_i730.SearchCubit>(
      () => _i730.SearchCubit(gh<_i731.SearchMoviesUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i833.RegisterModule {}
