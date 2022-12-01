import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ops_portal/constant/constants.dart';
import 'package:ops_portal/constant/strings.dart';
import 'package:ops_portal/network/result.dart';

typedef EntityMapper<Entity, Model> = Model Function(Entity entity);

abstract class ErrorCode {
  static const error = "Error";
  static const failed = "Failed";
  static const message = "message";
  static const unauthorized = "unauthorized";
}

abstract class BaseRepository {
  final String endpoint = AppConstants.apiEndpoint;

  final Map<String, String> _headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };

  final _logger = Logger();

  Dio get dio => Dio()..options.headers = _headers;

  Future<Result<ResponseType>> safeCall<RequestType, ResponseType>(
      Future<RequestType> call,
      {EntityMapper<RequestType, ResponseType>? entityMapper}) async {
    try {
      var response = await call;
      _logger.d("Api success message -> $response");
      //TODO:(Sreyans) If this code doesn't work, then try replacing the code "response as ResponseType" by some custom function
      return Success(entityMapper == null ? entityMapper!(response) : response as ResponseType);
    } catch (exception) {
      _logger.e(exception);
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.CONNECT_TIMEOUT:
          case DioErrorType.SEND_TIMEOUT:
          case DioErrorType.RECEIVE_TIMEOUT:
          case DioErrorType.CANCEL:
            _logger.e("Api error message -> ${AppStrings.poorNetworkError}");
            return Error(AppStrings.poorNetworkError);
            break;

          case DioErrorType.DEFAULT:
            _logger.e("Api error message -> ${AppStrings.noNetworkError}");
            return Error(AppStrings.noNetworkError);
            break;

          case DioErrorType.RESPONSE:
            return _getError(exception.response);
            break;
        }
      }
      return Error(AppStrings.genericError);
    }
  }

  Result<T> _getError<T>(Response response) {
    if (response?.data != null && response?.data is Map<String, dynamic>) {
      if ((response.data as Map<String, dynamic>)
          .containsKey(ErrorCode.message)) {
        _logger.e("Api error response -> ${response.data.toString()}");
        final errorMessage = response.data[ErrorCode.message];
        return Error(errorMessage);
      }
    }
    return Error(
      AppStrings.genericError,
    );
  }
}
