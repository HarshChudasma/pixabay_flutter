import 'dart:convert';
import 'dart:io';
import 'package:application/data/common/constants/api_endpoints_constants.dart';
import 'package:dio/dio.dart';
import 'package:application/app/utils/logger.dart';

final _ApiJWTService apiJwtService = _ApiJWTService();

class _ApiJWTService{

  static final _ApiJWTService _instance = _ApiJWTService.internal();
  _ApiJWTService.internal();

  factory _ApiJWTService() => _instance;

  _ApiJWTService._();

  static final Dio dio = createDio();

  /// CREATE DIO
  static Dio createDio() {
    Dio dio = Dio();
    dio.options = BaseOptions();
    dio.interceptors.addAll({ApiInterceptor()});
    return dio;
  }

  /// POST METHOD
  static Future<Response> post(
      {required String url, required Map<String, dynamic> body}) async {
    logger.f("body --> $body");
    var res = await dio.post(ApiRoutes.baseUrl+url, data: FormData.fromMap(body));
    return res;
  }

  /// GET METHOD
  static Future<Response> get({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    logger.f("url = $url");
    logger.f("url = ${dio.options.headers}");
    logger.f("body = $body");
    var res = await dio.get(
      ApiRoutes.baseUrl+url,
      queryParameters: body,
    );
    return res;
  }

}

/// Add Image
Future<MultipartFile> addImage({
  required File image,
  required String imageName,
}) async {
  return MultipartFile.fromFile(
    image.path,
    filename: imageName,
  );
}

/// CREATE API INTERCEPTOR
class ApiInterceptor extends Interceptor {
  /// REQUEST

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Map<String, dynamic> header = {};
    try {
      // if (authRepo.tokenKey.isNotEmpty && authRepo.apiKey.isNotEmpty ) {
      //   options.headers.addAll({
      //     'apiKey': authRepo.apiKey,
      //     'tokenKey': authRepo.tokenKey,
      //   });
      // }
      //   options.headers = {
      // 'Content-Type':'multipart/form-data'

      return handler.next(options);
    } catch (e) {
      logger.e("catch exception = $e");
    }
  }

  /// ERROR
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioException e = err;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        e = ConnectionTimeOutException(err.requestOptions);
        break;
      case DioExceptionType.sendTimeout:
        e = SendTimeOutException(err.requestOptions);
        break;
      case DioExceptionType.receiveTimeout:
        e = ReceiveTimeOutException(err.requestOptions);
        break;
      case DioExceptionType.unknown:
        switch (err.response?.statusCode) {
          case 400:
            e = BadRequestException(err.requestOptions);
            break;
          case 401:
            e = UnauthorizedException(err.requestOptions);
            break;
          case 402:
            e = UnauthorizedException(err.requestOptions);
            break;
          case 403:
            e = UnauthorizedException(err.requestOptions);
            break;
          case 404:
            e = NotFoundException(err.requestOptions);
            break;
          case 409:
            e = ConflictException(err.requestOptions);
            break;
          case 500:
            e = InternalServerErrorException(err.requestOptions);
            break;
        }
        break;
      case DioExceptionType.cancel:
        break;
      default:
        break;
    }
    return handler.next(e);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.f("${response.requestOptions.method} URL : ${response.requestOptions.path} , Body  : ${response.requestOptions.data} , QParam : ${response.requestOptions.queryParameters}\n\n\nResponse :${jsonEncode(response.data)}");
    handler.next(response);
  }
}

/// When connection timeout
class ConnectionTimeOutException extends DioException {
  ConnectionTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection Timed out, Please try again';
  }
}

class SendTimeOutException extends DioException {
  SendTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Send Timed out, Please try again';
  }
}

class ReceiveTimeOutException extends DioException {
  ReceiveTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Receive Timed out, Please try again';
  }
}

//**********-----STATUS CODE ERROR HANDLERS--------**********

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Internal server error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // LocalStorageService.removeLogin();
    // app.userModel.value = UserModel.fromEmpty();
    // Get.offAllNamed(AppRoutes.login);
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}