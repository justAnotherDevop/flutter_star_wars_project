import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/usecase/base_async_use_case.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';
import 'package:fpdart/fpdart.dart';

import '../models/character_domain.dart';

class GetCharactersUseCase extends BaseAsyncUseCase<List<CharacterDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();

  @override
  Future<Either<Exception, List<CharacterDomain?>>> execute(List<String> urls) async {
    final List<Future<CharacterDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getCharacter(url));
    }
    try {
      final results = await Future.wait(parallelCalls);
      return Right(results.whereType<CharacterDomain>().toList());
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching characters asynchronously $exception, $trace");
      }
      return Left(exception as Exception);
    }
  }
}