import 'dart:async';
import 'dart:convert';
import 'env.dart';
import 'package:http/http.dart' as http;

class Api {
  final String urlBase;
  Map<String, String> _headers = {"Authorization": "Bearer " + TOKEN};

  Api(this.urlBase);

  String getErrorMessage(Map response, {String msg = "Invalid request"}) {
    String message = msg;
    if (response["message"] != null) {
      return response["message"];
    }
    if (response["errors"] != null) {
      List messages = response["errors"].values.toList();
      if (messages.isNotEmpty) {
        message = messages[0][0].toString();
      }
    }
    return message;
  }

  Future<dynamic> get(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(Uri.parse(urlBase + uri),
          headers: headers ?? _headers);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  Future<dynamic> post(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    print(urlBase + uri);
    try {
      http.Response response = await http.post(Uri.parse(urlBase + uri),
          body: body, headers: headers ?? _headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  Future<dynamic> postWithFile(String uri, String filekey, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(uri));
      request.headers.addAll(_headers);
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers[key] = value;
        });
      }
      request.files
          .add(await http.MultipartFile.fromPath(filekey, body[filekey]));
      body.forEach((key, value) {
        if (key != filekey) {
          request.fields[key] = value.toString();
        }
      });
      var res = await request.send().asStream().first;

      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw FetchDataException("Error request:", res.statusCode);
      }
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(await res.stream.bytesToString());
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  Future<dynamic> put(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.put(Uri.parse(urlBase + uri),
          body: body, headers: headers ?? _headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  Future<dynamic> delete(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.delete(Uri.parse(urlBase + uri),
          headers: headers ?? _headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }
}

class FetchDataException implements Exception {
  String _message;
  int _code;

  FetchDataException(this._message, this._code);

  @override
  String toString() {
    return "Exception: $_message/$_code";
  }

  int code() {
    return _code;
  }
}
