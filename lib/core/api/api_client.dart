import 'dart:io';
import 'package:http/http.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/core/exception/api_exception.dart';

enum Method { get, post, delete, patch, put }

class ApiClient {
  final client = Client();
  Future<dynamic> call(
      {Method method = Method.get,
      required String uri,
      Map<String, dynamic>? params}) async {
    Response response;
    try {
      if (method == Method.delete) {
        response = await client.delete(Uri.parse(uri), body: params);
      } else if (method == Method.post) {
        response = await client.post(Uri.parse(uri), body: params);
      } else if (method == Method.put) {
        response = await client.put(Uri.parse(uri), body: params);
      } else if (method == Method.patch) {
        response = await client.patch(Uri.parse(uri), body: params);
      } else {
        response =
            await client.get(Uri.parse('http://${ApiConstants.baseUrl}$uri'));
      }
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        throw ResponseException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NetwrokException();
    } on FormatException {
      throw InvalidFormatException();
    } catch (e) {
      throw Exception(e);
    }
  }
}
