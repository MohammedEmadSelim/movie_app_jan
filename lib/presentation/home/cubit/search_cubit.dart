import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_station_app/domain/movies/use_cases/search_movies_use_case.dart';
import 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  SearchCubit(this.searchMoviesUseCase) : super(SearchInitial());

  Timer? _debounce;
  String _lastQuery = '';

  void onQueryChanged(String query) {
    final trimmedQuery = query.trim();

    if (trimmedQuery == _lastQuery) return;

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _search(trimmedQuery);
    });
  }

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      _lastQuery = '';
      emit(SearchInitial());
      return;
    }

    _lastQuery = query;
    emit(SearchLoading());

    try {
      final movies = await searchMoviesUseCase(query);
      emit(SearchLoaded(movies));
    } catch (_) {
      emit(SearchError('Something went wrong. Please try again.'));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
