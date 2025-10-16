import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/base_async_use_case.dart';
import 'package:flutter_star_wars_project/domain/models/species_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';

class GetSpeciesUseCase extends BaseAsyncUseCase<List<SpeciesDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<List<SpeciesDomain?>> execute(List<String> urls) {
    final List<Future<SpeciesDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getSpecies(url));
    }
    try {
      return Future.wait(parallelCalls);
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching species asynchronously $exception, $trace");
      }
      rethrow;
    }
  }
}