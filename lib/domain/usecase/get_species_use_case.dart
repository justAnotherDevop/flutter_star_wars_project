import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/models/species_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';
import 'package:fpdart/fpdart.dart';

import 'base_async_use_case.dart';

class GetSpeciesUseCase extends BaseAsyncUseCase<List<SpeciesDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<Either<Exception, List<SpeciesDomain?>>> execute(List<String> urls) async {
    final List<Future<SpeciesDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getSpecies(url));
    }
    try {
      final results = await Future.wait(parallelCalls);
      return Right(results.whereType<SpeciesDomain>().toList());
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching characters asynchronously $exception, $trace");
      }
      return Left(exception as Exception);
    }
  }
}