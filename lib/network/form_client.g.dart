// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Applicant _$ApplicantFromJson(Map<String, dynamic> json) => Applicant()
  ..username = json['user_login_name'] as String?
  ..personal_email = json['user_personal_email'] as String?
  ..password = json['user_password'] as String?
  ..contact = json['user_contact_no'] as String?
  ..whatsapp = json['user_whatsapp_id'] as String?
  ..firstname = json['user_first_name'] as String?
  ..lastname = json['user_last_name'] as String?
  ..gender = json['user_gender'] as String?
  ..dob = json['user_DOB'] as String?
  ..github = json['user_github'] as String?
  ..skype = json['user_skype'] as String?
  ..linkedIn = json['user_linked_in'] as String?
  ..resumeUrl = json['user_resume_url'] as String?
  ..profileUrl = json['user_image_url'] as String?
  ..curr_salary = json['user_curr_sal'] as int?
  ..exp_salary = json['user_exp_sal'] as int?
  ..skillset = json['user_skillset'] as String?
  ..isEmployee = json['user_is_emp'] as String?
  ..company_email = json['user_company_email'] as String?
  ..role = json['user_access_role'] as String?
  ..department = json['user_dept'] as String?
  ..location = json['user_location'] as String?
  ..remarks = json['user_remarks'] as String?;

Map<String, dynamic> _$ApplicantToJson(Applicant instance) => <String, dynamic>{
      'user_login_name': instance.username,
      'user_personal_email': instance.personal_email,
      'user_password': instance.password,
      'user_contact_no': instance.contact,
      'user_whatsapp_id': instance.whatsapp,
      'user_first_name': instance.firstname,
      'user_last_name': instance.lastname,
      'user_gender': instance.gender,
      'user_DOB': instance.dob,
      'user_github': instance.github,
      'user_skype': instance.skype,
      'user_linked_in': instance.linkedIn,
      'user_resume_url': instance.resumeUrl,
      'user_image_url': instance.profileUrl,
      'user_curr_sal': instance.curr_salary,
      'user_exp_sal': instance.exp_salary,
      'user_skillset': instance.skillset,
      'user_is_emp': instance.isEmployee,
      'user_company_email': instance.company_email,
      'user_access_role': instance.role,
      'user_dept': instance.department,
      'user_location': instance.location,
      'user_remarks': instance.remarks,
    };

FileUploadedDetails _$FileUploadedDetailsFromJson(Map<String, dynamic> json) =>
    FileUploadedDetails()..file_url = json['file_url'] as String?;

Map<String, dynamic> _$FileUploadedDetailsToJson(
        FileUploadedDetails instance) =>
    <String, dynamic>{
      'file_url': instance.file_url,
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
    baseUrl ??= 'http://ec2-65-2-73-14.ap-south-1.compute.amazonaws.com:5000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Applicant>> getAllApplicantDetails() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Applicant>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/obtainuserinfo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Applicant.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<FileUploadedDetails> uploadFile(source_file) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
      'source_file',
      MultipartFile.fromFileSync(
        source_file.path,
        filename: source_file.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FileUploadedDetails>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/upload',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FileUploadedDetails.fromJson(_result.data!);
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
