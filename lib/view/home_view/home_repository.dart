

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/api.dart';
import '../../data/network/network_api_services.dart';

import '../../model/movie.dart';

final homerepProvider = Provider((ref) => HomeRepository());

class HomeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<MoviesModel> getMovie() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesapi);
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<List<MoviesModel>> getMovies() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesapi);

      List<dynamic> moviesData = response; // Assuming response is a List<dynamic>

      List<MoviesModel> movies = moviesData.map((movie) {
        return MoviesModel.fromJson(movie);
      }).toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
