
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/clients/remote_client.dart';
import 'package:flutter_star_wars_project/data/repository/movie_details_repository.dart';
import 'package:flutter_star_wars_project/models/character.dart' as data;
import 'package:flutter_star_wars_project/models/starship.dart' as data;
import 'package:flutter_star_wars_project/models/vehicle.dart' as data;
import 'package:flutter_star_wars_project/models/Species.dart' as data;
import 'package:flutter_star_wars_project/models/planet.dart' as data;
import 'package:flutter_star_wars_project/domain/models/character_domain.dart' as domain;
import 'package:flutter_star_wars_project/domain/models/starship_domain.dart' as domain;
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart' as domain;
import 'package:flutter_star_wars_project/domain/models/species_domain.dart' as domain;
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart' as domain;
import 'package:http/http.dart' as http;
import '../../data/json_parser.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  @override
  Future<domain.CharacterDomain?> getCharacter(String url) async {
    final remoteClient = RemoteClientBuilder()
        .setBaseUrl(url)
        .addQueryParam("format", "json")
        .build();

    try {
      final response = await remoteClient.client?.get(
        Uri.parse(
          remoteClient.getFullUrl(),
        ).replace(queryParameters: remoteClient.queryParams),
      );
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<data.Character, Map<String, dynamic>>(
            response.body,
            (json) => data.Character.fromJson(json as Map<String, dynamic>),
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
        print("Network Parsing Error - Get Character: $exception, $trace");
      }
    }
    remoteClient.close();
    return null;
  }

  @override
  Future<domain.PlanetDomain?> getPlanet(String url) async {
    final remoteClient = RemoteClientBuilder()
        .setBaseUrl(url)
        .addQueryParam("format", "json")
        .build();

    try {
      final response = await remoteClient.client?.get(
        Uri.parse(
          remoteClient.getFullUrl(),
        ).replace(queryParameters: remoteClient.queryParams),
      );
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<data.Planet, Map<String, dynamic>>(
            response.body,
            (json) => data.Planet.fromJson(json as Map<String, dynamic>),
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
        print("Network Parsing Error - Get Character: $exception, $trace");
      }
    }
    remoteClient.close();
    return null;
  }

  @override
  Future<domain.SpeciesDomain?> getSpecies(String url) async {
    final remoteClient = RemoteClientBuilder()
        .setBaseUrl(url)
        .addQueryParam("format", "json")
        .build();

    try {
      final response = await remoteClient.client?.get(
        Uri.parse(
          remoteClient.getFullUrl(),
        ).replace(queryParameters: remoteClient.queryParams),
      );
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<data.Species, Map<String, dynamic>>(
            response.body,
                (json) => data.Species.fromJson(json as Map<String, dynamic>),
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
        print("Network Parsing Error - Get Species: $exception, $trace");
      }
    }
    remoteClient.close();
    return null;
  }

  @override
  Future<domain.StarshipDomain?> getStarship(String url) async {
    final remoteClient = RemoteClientBuilder()
        .setBaseUrl(url)
        .addQueryParam("format", "json")
        .build();

    try {
      final response = await remoteClient.client?.get(
        Uri.parse(
          remoteClient.getFullUrl(),
        ).replace(queryParameters: remoteClient.queryParams),
      );
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<data.Starship, Map<String, dynamic>>(
            response.body,
                (json) => data.Starship.fromJson(json as Map<String, dynamic>),
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
        print("Network Parsing Error - Get Character: $exception, $trace");
      }
    }
    remoteClient.close();
    return null;
  }

  @override
  Future<domain.VehicleDomain?> getVehicle(String url) async {
    final remoteClient = RemoteClientBuilder()
        .setBaseUrl(url)
        .addQueryParam("format", "json")
        .build();

    try {
      final response = await remoteClient.client?.get(
        Uri.parse(
          remoteClient.getFullUrl(),
        ).replace(queryParameters: remoteClient.queryParams),
      );
      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final result = JsonParser.parse<data.Vehicle, Map<String, dynamic>>(
            response.body,
                (json) => data.Vehicle.fromJson(json as Map<String, dynamic>),
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
        print("Network Parsing Error - Get Character: $exception, $trace");
      }
    }
    remoteClient.close();
    return null;
  }
}
