import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';
import 'package:fpdart/fpdart.dart';

import '../models/starship_domain.dart';
import 'base_async_use_case.dart';

class GetStarshipsUseCase
    extends BaseAsyncUseCase<List<StarshipDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository =
      MovieDetailsRepositoryImpl();

  @override
  Future<Either<Exception, List<StarshipDomain?>>> execute(
    List<String> urls,
  ) async {
    final List<Future<StarshipDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getStarship(url));
    }
    try {
      final results = await Future.wait(parallelCalls);
      return Right(results.whereType<StarshipDomain>().toList());
    } catch (exception, trace) {
      if (kDebugMode) {
        print(
          "Error while fetching characters asynchronously $exception, $trace",
        );
      }
      return Left(exception as Exception);
    }
  }
}
