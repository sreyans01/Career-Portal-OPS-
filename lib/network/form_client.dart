import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ops_portal/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'form_client.g.dart';

/**
 * Client for sending the form related requests to and from the api.
 * Note: The file upload request for Web is written separately.
 */
@RestApi(baseUrl: Constants.BASE_URL)
abstract class FormClient {
  factory FormClient(Dio dio, {String baseUrl}) = _FormClient;

  @GET("/obtainuserinfo")
  Future<List<Applicant>> getAllApplicantDetails();

  @POST("/upload")
  @MultiPart()
  Future<FileUploadedDetails> uploadFile(@Part() File source_file);
}

/**
 * Model class for storing the applicant data.
 */
@JsonSerializable()
class Applicant {
  @JsonKey(name: "user_login_name")
  String? username;
  @JsonKey(name: "user_personal_email")
  String? personal_email;
  @JsonKey(name: "user_password")
  String? password;
  @JsonKey(name: "user_contact_no")
  String? contact;
  @JsonKey(name: "user_whatsapp_id")
  String? whatsapp;
  @JsonKey(name: "user_first_name")
  String? firstname;
  @JsonKey(name: "user_last_name")
  String? lastname;
  @JsonKey(name: "user_gender")
  String? gender;
  @JsonKey(name: "user_DOB")
  String? dob;
  @JsonKey(name: "user_github")
  String? github;
  @JsonKey(name: "user_skype")
  String? skype;
  @JsonKey(name: "user_linked_in")
  String? linkedIn;
  @JsonKey(name: "user_resume_url")
  String? resumeUrl;
  @JsonKey(name: "user_image_url")
  String? profileUrl;

  @JsonKey(name: "user_curr_sal")
  int? curr_salary;
  @JsonKey(name: "user_exp_sal")
  int? exp_salary;
  @JsonKey(name: "user_skillset")
  String? skillset;

  @JsonKey(name: "user_is_emp")
  String? isEmployee;

  //Extra fields which will be null initially before the candidate joins the company.
  @JsonKey(name: "user_company_email")
  String? company_email;
  @JsonKey(name: "user_access_role")
  String? role;
  @JsonKey(name: "user_dept")
  String? department;
  @JsonKey(name: "user_location")
  String? location;
  @JsonKey(name: "user_remarks")
  String? remarks;

  Applicant();

  factory Applicant.fromJson(Map<String, dynamic> json) =>
      _$ApplicantFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantToJson(this);
}

/**
 * Model class for fetching the File uploaded details data.
 */
@JsonSerializable()
class FileUploadedDetails {
  String? file_url;

  FileUploadedDetails();

  factory FileUploadedDetails.fromJson(Map<String, dynamic> json) =>
      _$FileUploadedDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FileUploadedDetailsToJson(this);
}
