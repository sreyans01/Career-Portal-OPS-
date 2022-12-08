import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dummy_client.g.dart';

@RestApi(baseUrl: "http://10.10.2.22:5000")
abstract class DummyClient {
  factory DummyClient(Dio dio, {String baseUrl}) = _DummyClient;

  @GET("/user")
  Future<DummyData> getUserDataDummy(@Query("id") int id);
}

@JsonSerializable()
class DummyData {
  @JsonKey(name: "_id")
  int? iId;
  int? userId;
  String? firstName;
  String? lastName;
  String? profileURL;
  String? resumeURL;
  String? phoneNo;
  String? whatsappNo;
  String? skypeId;
  String? email;
  String? location;
  int? currentSalary;
  int? expectedSalary;
  String? remarks;

  DummyData({this.iId, this.userId, this.firstName, this.lastName, this.profileURL, this.resumeURL, this.phoneNo, this.whatsappNo, this.skypeId, this.email, this.location, this.currentSalary, this.expectedSalary, this.remarks});

  factory DummyData.fromJson(Map<String, dynamic> json) => _$DummyDataFromJson(json);
  Map<String, dynamic> toJson() => _$DummyDataToJson(this);
}