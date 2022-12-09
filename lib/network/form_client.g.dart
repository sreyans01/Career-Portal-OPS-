// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Applicant _$ApplicantFromJson(Map<String, dynamic> json) => Applicant()
  ..username = json['username'] as String?
  ..personal_email = json['personal_email'] as String?
  ..password = json['password'] as String?
  ..contact = json['contact'] as String?
  ..whatsapp = json['whatsapp'] as String?
  ..firstname = json['firstname'] as String?
  ..lastname = json['lastname'] as String?
  ..gender = json['gender'] as String?
  ..dob = json['dob'] as String?
  ..github = json['github'] as String?
  ..skype = json['skype'] as String?
  ..linkedIn = json['linkedIn'] as String?
  ..resumeUrl = json['resumeUrl'] as String?
  ..profileUrl = json['profileUrl'] as String?
  ..curr_salary = json['curr_salary'] as String?
  ..exp_salary = json['exp_salary'] as String?
  ..isEmployee = json['isEmployee'] as bool
  ..company_email = json['company_email'] as String?
  ..role = json['role'] as String?
  ..department = json['department'] as String?
  ..location = json['location'] as String?;

Map<String, dynamic> _$ApplicantToJson(Applicant instance) => <String, dynamic>{
      'username': instance.username,
      'personal_email': instance.personal_email,
      'password': instance.password,
      'contact': instance.contact,
      'whatsapp': instance.whatsapp,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'dob': instance.dob,
      'github': instance.github,
      'skype': instance.skype,
      'linkedIn': instance.linkedIn,
      'resumeUrl': instance.resumeUrl,
      'profileUrl': instance.profileUrl,
      'curr_salary': instance.curr_salary,
      'exp_salary': instance.exp_salary,
      'isEmployee': instance.isEmployee,
      'company_email': instance.company_email,
      'role': instance.role,
      'department': instance.department,
      'location': instance.location,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _FormClient implements FormClient {
  _FormClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://jsonplaceholder.typicode.com/todos/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Applicant> getTasks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Applicant>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Applicant.fromJson(_result.data!);
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
