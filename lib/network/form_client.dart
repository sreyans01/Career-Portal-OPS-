import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'form_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/todos/1")
abstract class FormClient {
  factory FormClient(Dio dio, {String baseUrl}) = _FormClient;

  @GET("")
  Future<Applicant> getTasks();
}

@JsonSerializable()
class Applicant {
  String? username;
  String? personal_email;
  String? password;
  String? contact;
  String? whatsapp;
  String? firstname;
  String? lastname;
  String? gender;
  String? dob;
  String? github;
  String? skype;
  String? linkedIn;
  String? resumeUrl;
  String? profileUrl;

  String? curr_salary;
  String? exp_salary;

  //Extra fields which will be null initially before the candidate joins the company.
  bool isEmployee = false;
  String? company_email;
  String? role;
  String? department;
  String? location;

  Applicant();

  factory Applicant.fromJson(Map<String, dynamic> json) => _$ApplicantFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantToJson(this);
}