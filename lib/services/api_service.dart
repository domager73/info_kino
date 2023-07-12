import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://kinopoiskapiunofficial.tech/api/v2.2/',
      headers: {
        'X-API-KEY': 'e0051dc4-cb65-4879-84d6-ce356fc70a4e',
        'Content-Type': 'application/json',
      },
    ),
  );

  static const String _films = 'films?order';
  static const String _premieres = 'films/premieres';
  static const String _film = 'films/';


}
