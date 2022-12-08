// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyData _$DummyDataFromJson(Map<String, dynamic> json) => DummyData(
      iId: json['_id'] as int?,
      userId: json['userId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      profileURL: json['profileURL'] as String?,
      resumeURL: json['resumeURL'] as String?,
      phoneNo: json['phoneNo'] as String?,
      whatsappNo: json['whatsappNo'] as String?,
      skypeId: json['skypeId'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      currentSalary: json['currentSalary'] as int?,
      expectedSalary: json['expectedSalary'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$DummyDataToJson(DummyData instance) => <String, dynamic>{
      '_id': instance.iId,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profileURL': instance.profileURL,
      'resumeURL': instance.resumeURL,
      'phoneNo': instance.phoneNo,
      'whatsappNo': instance.whatsappNo,
      'skypeId': instance.skypeId,
      'email': instance.email,
      'location': instance.location,
      'currentSalary': instance.currentSalary,
      'expectedSalary': instance.expectedSalary,
      'remarks': instance.remarks,
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
