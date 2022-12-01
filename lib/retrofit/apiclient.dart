import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

class Apis {
  static const String users = '/users';
}

@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseBody> getUsers();
}