
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'dummy_client.g.dart';

@RestApi(baseUrl: "http://10.10.2.22:5000")
abstract class DummyClient {
  factory DummyClient(Dio dio, {String baseUrl}) = _DummyClient;

  @GET("/user")
  Future<DummyData> getUserDataDummy(@Query("id") int id);

  @MultiPart()
  @POST("/user")
  Future<DummyData> updateUserDataDummy(@Body() DummyData data);

  @POST("/create")
  Future<DummyData2> updateUserDataDummy2(@Body() DummyData2 data);
}

@JsonSerializable()
class DummyData {
  @JsonKey(name: "_id")
  int? iId;
  int? userId;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  String? profileURL;
  String? resumeURL;
  @JsonKey(name: "phone_no")
  String? phoneNo;
  @JsonKey(name: "whatsapp_no")
  String? whatsappNo;
  @JsonKey(name: "skype_id")
  String? skypeId;
  String? email;
  String? location;
  @JsonKey(name: "cur_salary")
  int? currentSalary;
  @JsonKey(name: "exp_salary")
  int? expectedSalary;
  String? remarks;

  DummyData({this.iId, this.userId, this.firstName, this.lastName, this.profileURL, this.resumeURL, this.phoneNo, this.whatsappNo, this.skypeId, this.email, this.location, this.currentSalary, this.expectedSalary, this.remarks});

  factory DummyData.fromJson(Map<String, dynamic> json) => _$DummyDataFromJson(json);
  Map<String, dynamic> toJson() => _$DummyDataToJson(this);
}

@JsonSerializable()
class DummyData2 {
  String? name;
  String? salary;
  String? age;

  DummyData2({this.name, this.salary, this.age});

  factory DummyData2.fromJson(Map<String, dynamic> json) => _$DummyData2FromJson(json);
  Map<String, dynamic> toJson() => _$DummyData2ToJson(this);
}