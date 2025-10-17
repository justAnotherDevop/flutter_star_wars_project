import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';
import 'package:fpdart/fpdart.dart';

import 'base_async_use_case.dart';


class GetVehiclesUseCase extends BaseAsyncUseCase<List<VehicleDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<Either<Exception, List<VehicleDomain?>>> execute(List<String> urls) async {
    final List<Future<VehicleDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getVehicle(url));
    }
    try {
      final results = await Future.wait(parallelCalls);
      return Right(results.whereType<VehicleDomain>().toList());
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching characters asynchronously $exception, $trace");
      }
      return Left(exception as Exception);
    }
  }
}