import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'form_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/todos/1")
abstract class FormClient {
  factory FormClient(Dio dio, {String baseUrl}) = _FormClient;

  @GET("")
  Future<FormData> getTasks();
}

@JsonSerializable()
class FormData {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  FormData({this.userId, this.id, this.title, this.completed});

  factory FormData.fromJson(Map<String, dynamic> json) => _$FormDataFromJson(json);
  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}