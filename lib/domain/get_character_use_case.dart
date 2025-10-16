import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/base_async_use_case.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';

import 'models/character_domain.dart';

class GetCharacterUseCase extends BaseAsyncUseCase<List<CharacterDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<List<CharacterDomain?>> execute(List<String> urls) {
    final List<Future<CharacterDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getCharacter(url));
    }
    try {
      return Future.wait(parallelCalls);
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching characters asynchronously $exception, $trace");
      }
      rethrow;
    }
  }
}