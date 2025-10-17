
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/clients/remote_client.dart';
import 'package:flutter_star_wars_project/data/constants.dart';
import 'package:flutter_star_wars_project/data/json_parser.dart';
import 'package:flutter_star_wars_project/domain/repository/movies_repository.dart';
import 'package:flutter_star_wars_project/models/film.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/movie_domain.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RemoteClient _remoteClient;

  MoviesRepositoryImpl.initialise() : _remoteClient = RemoteClientBuilder()
      .setBaseUrl(Constants.baseUrl)
      .setPath(Constants.filmsPath)
      .addQueryParam("format", "json")
      .build();

  @override
  Future<List<MovieDomain>> getMovies() async {
    try {
      final response = await _remoteClient.request();
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<FilmResponse, Map<String, dynamic>>(
            response.body,
            (json) => FilmResponse.fromJson(json as Map<String, dynamic>),
          );
          return result.toDomain();
        } else {
          throw http.ClientException(
            'API Error: ${response.statusCode} - ${response.reasonPhrase}',
            response.request?.url,
          );
        }
      }
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Network Parsing Error Get Movies: $exception, $trace");
      }
    }
    return [];
  }
}
