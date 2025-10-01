import 'dart:convert';

import 'package:flutter/foundation.dart';

class JsonParser {
  static R parse<R, T>(
      String jsonString,
      R Function(dynamic json) fromJson,
      ) {
    try {
      final dynamic decoded = json.decode(jsonString);
      return fromJson(decoded);
    } on FormatException catch (e) {
      if (kDebugMode) {
        print('Error parsing JSON string or applying fromJsonFactory: $e');
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('An unexpected error occurred during parsing: $e');
      }
      rethrow;
    }
  }
}