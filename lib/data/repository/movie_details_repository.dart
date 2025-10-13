import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/data/clients/remote_client.dart';
import 'package:flutter_star_wars_project/models/character.dart';
import 'package:flutter_star_wars_project/models/starship.dart';
import 'package:flutter_star_wars_project/models/vehicle.dart';
import 'package:http/http.dart' as http;

import '../../models/Species.dart';
import '../../models/planet.dart';
import '../json_parser.dart';

void main() async {
  final repo = MovieDetailsRepository();
  
  final result = await repo.getCharacter( "https://swapi.dev/api/people/2/");

  print("${result?.name}, ${result?.birthYear}");

}

class MovieDetailsRepository {
  Future<Character?> getCharacter(String url) async {
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
          final result = JsonParser.parse<Character, Map<String, dynamic>>(
            response.body,
            (json) => Character.fromJson(json as Map<String, dynamic>),
          );
          return result;
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

  Future<Planet?> getPlanet(String url) async {
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
          final result = JsonParser.parse<Planet, Map<String, dynamic>>(
            response.body,
            (json) => Planet.fromJson(json as Map<String, dynamic>),
          );
          return result;
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

  Future<Species?> getSpecies(String url) async {
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
          final result = JsonParser.parse<Species, Map<String, dynamic>>(
            response.body,
                (json) => Species.fromJson(json as Map<String, dynamic>),
          );
          return result;
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

  Future<Starship?> getStarship(String url) async {
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
          final result = JsonParser.parse<Starship, Map<String, dynamic>>(
            response.body,
                (json) => Starship.fromJson(json as Map<String, dynamic>),
          );
          return result;
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

  Future<Vehicle?> getVehicle(String url) async {
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
          final result = JsonParser.parse<Vehicle, Map<String, dynamic>>(
            response.body,
                (json) => Vehicle.fromJson(json as Map<String, dynamic>),
          );
          return result;
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
