import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/domain/base_async_use_case.dart';
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movie_details_repository_impl.dart';


class GetVehiclesUseCase extends BaseAsyncUseCase<List<VehicleDomain?>, List<String>> {
  final MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepositoryImpl();
  @override
  Future<List<VehicleDomain?>> execute(List<String> urls) {
    final List<Future<VehicleDomain?>> parallelCalls = [];
    for (var url in urls) {
      parallelCalls.add(_movieDetailsRepository.getVehicle(url));
    }
    try {
      return Future.wait(parallelCalls);
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching vehicles asynchronously $exception, $trace");
      }
      rethrow;
    }
  }
}