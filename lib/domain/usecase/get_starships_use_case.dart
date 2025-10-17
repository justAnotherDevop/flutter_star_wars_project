import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';

import '../models/starship_domain.dart';
import 'base_async_use_case.dart';

class GetStarshipsUseCase extends BaseAsyncUseCase<List<StarshipDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<List<StarshipDomain?>> execute(List<String> urls) {
    final List<Future<StarshipDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getStarship(url));
    }
    try {
      return Future.wait(parallelCalls);
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching starships asynchronously $exception, $trace");
      }
      rethrow;
    }
  }
}