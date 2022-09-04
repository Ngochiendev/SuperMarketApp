import 'package:dio/dio.dart';

abstract class HttpMethods {
  static String get = 'GET';
  static String post = 'POST';
  static String put = 'PUT';
  static String patch = 'PATCH';
  static String delete = 'DELETE';
}

class HttpManager {
  Future resrequest({
    required String url,
    required String method,
    Map? header,
    Map? body,
  }) async {
    final defaultHeader = header?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });
    Dio dio = Dio();
    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeader,
          method: method,
        ),
        data: body,
      );
    } on DioError catch(error){

    } catch (error){}
  }
}
