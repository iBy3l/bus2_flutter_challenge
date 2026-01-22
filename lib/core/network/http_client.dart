import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../utils/app_exceptions.dart';

class AppHttpClient {
  final HttpClient _client;

  AppHttpClient({HttpClient? client}) : _client = client ?? HttpClient();

  Future<Map<String, dynamic>> getJson(
    Uri uri, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      final request = await _client.getUrl(uri).timeout(timeout);

      request.headers.set(HttpHeaders.acceptHeader, 'application/json');
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');

      final response = await request.close().timeout(timeout);

      final body = await response.transform(utf8.decoder).join();

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ServerException(
          response.statusCode,
          'Falha HTTP ${response.statusCode}: ${response.reasonPhrase ?? ''}',
          cause: body,
        );
      }

      final decoded = jsonDecode(body);

      if (decoded is! Map<String, dynamic>) {
        throw ParseException(
          'Resposta inválida: JSON não é um objeto',
          cause: decoded,
        );
      }

      return decoded;
    } on SocketException catch (e, st) {
      throw NetworkException(
        'Sem conexão com a internet ou DNS falhou.',
        cause: e,
        stackTrace: st,
      );
    } on HandshakeException catch (e, st) {
      throw NetworkException(
        'Falha de SSL/Handshake com o servidor.',
        cause: e,
        stackTrace: st,
      );
    } on FormatException catch (e, st) {
      throw ParseException('Falha ao parsear JSON.', cause: e, stackTrace: st);
    } on TimeoutException catch (e, st) {
      throw TimeoutException(
        'Tempo de requisição esgotado após ${timeout.inSeconds} segundos.',
        cause: e,
        stackTrace: st,
      );
    }
  }

  void close() => _client.close(force: true);
}
