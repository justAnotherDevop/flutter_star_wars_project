import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';

import 'base_async_use_case.dart';


class GetPlanetsUseCase extends BaseAsyncUseCase<List<PlanetDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<List<PlanetDomain?>> execute(List<String> urls) {
    final List<Future<PlanetDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getPlanet(url));
    }
    try {
      return Future.wait(parallelCalls);
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching planets asynchronously $exception, $trace");
      }
      rethrow;
    }
  }
}