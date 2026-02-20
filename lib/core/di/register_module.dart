import 'package:injectable/injectable.dart';
import '../constants/app_const.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  String get tmdbToken => AppConstants.tmdbToken;
}
