import 'package:hive/hive.dart';
import '../models/movie_model.dart';

Box<MovieModel> get moviesBox => Hive.box<MovieModel>('movies');