import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/response/api_response.dart';
import '../../model/movie.dart';
import 'home_repository.dart';



final homeViewModelProvider = Provider((ref) => HomeViewModel());

class HomeViewModel {
  Future<List<MoviesModel>> fetchMoviesListApi(WidgetRef ref) async {

   return await ref.read(homerepProvider).getMovies();
  }
}