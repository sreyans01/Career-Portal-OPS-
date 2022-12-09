// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyData _$DummyDataFromJson(Map<String, dynamic> json) => DummyData(
      iId: json['_id'] as int?,
      userId: json['userId'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileURL: json['profileURL'] as String?,
      resumeURL: json['resumeURL'] as String?,
      phoneNo: json['phone_no'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      skypeId: json['skype_id'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      currentSalary: json['cur_salary'] as int?,
      expectedSalary: json['exp_salary'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$DummyDataToJson(DummyData instance) => <String, dynamic>{
      '_id': instance.iId,
      'userId': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profileURL': instance.profileURL,
      'resumeURL': instance.resumeURL,
      'phone_no': instance.phoneNo,
      'whatsapp_no': instance.whatsappNo,
      'skype_id': instance.skypeId,
      'email': instance.email,
      'location': instance.location,
      'cur_salary': instance.currentSalary,
      'exp_salary': instance.expectedSalary,
      'remarks': instance.remarks,
    };

DummyData2 _$DummyData2FromJson(Map<String, dynamic> json) => DummyData2(
      name: json['name'] as String?,
      salary: json['salary'] as String?,
      age: json['age'] as String?,
    );

Map<String, dynamic> _$DummyData2ToJson(DummyData2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'salary': instance.salary,
      'age': instance.age,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DummyClient implements DummyClient {
  _DummyClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://10.10.2.22:5000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DummyData> getUserDataDummy(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DummyData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DummyData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DummyData> updateUserDataDummy(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DummyData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DummyData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DummyData2> updateUserDataDummy2(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DummyData2>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DummyData2.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
