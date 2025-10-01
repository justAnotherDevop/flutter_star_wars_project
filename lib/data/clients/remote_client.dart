import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class RemoteClient {
  final String _baseUrl;
  final String _path;
  final Client? client;
  final Map<String, dynamic>? _queryParametersMap;

  RemoteClient._(
    Client? httpClient, {
    required String baseUrl,
    required String path,
    required Map<String, dynamic>? queryParameters,
  }) : _path = path,
       _queryParametersMap = queryParameters,
       _baseUrl = baseUrl,
       client = httpClient ?? Client();

  String getFullUrl() {
    String effectiveBaseUrl = _baseUrl;
    if (_baseUrl.endsWith('/')) {
      effectiveBaseUrl = _baseUrl.substring(0, _baseUrl.length - 1);
    }
    String effectivePath = _path;
    if (_path.startsWith('/')) {
      effectivePath = _path.substring(1);
    }
    return '$effectiveBaseUrl/$effectivePath';
  }

  Map<String, dynamic>? get queryParams => _queryParametersMap;

  void close() {
    client?.close();
    if (kDebugMode) {
      print("Client Closed for $getFullUrl()");
    }
  }
}

class RemoteClientBuilder {
  String? _baseUrl;
  String _path = "";
  Client? _client;
  final Map<String, dynamic> _queryParametersMap = {};

  RemoteClientBuilder setBaseUrl(String baseUrl) {
    if (baseUrl.isEmpty) {
      throw ArgumentError("Base URL cannot be empty.");
    }
    _baseUrl = baseUrl;
    return this;
  }

  RemoteClientBuilder setPath(String path) {
    if (path.isEmpty) {
      _path = "/";
    } else {
      _path = path;
    }
    return this;
  }

  RemoteClientBuilder addQueryParam(String key, dynamic value) {
    if (key.isEmpty) {
      throw ArgumentError("Query parameter key cannot be empty.");
    }
    _queryParametersMap[key] = value;
    return this;
  }

  RemoteClientBuilder client(Client client) {
    _client = client;
    return this;
  }

  RemoteClient build() {
    if (_baseUrl == null) {
      throw StateError(
        "Base URL must be set before building the RemoteClient.",
      );
    }

    return RemoteClient._(
      _client,
      queryParameters: _queryParametersMap.isNotEmpty
          ? Map.unmodifiable(_queryParametersMap)
          : null,
      baseUrl: _baseUrl!,
      path: _path,
    );
  }

  @override
  String toString() {
    return 'RemoteClient(baseUrl: $_baseUrl, path: $_path)';
  }
}
