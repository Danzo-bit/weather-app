import 'package:dio/dio.dart';

class BaseService{
 final Dio _dio = Dio(
   BaseOptions(
     baseUrl: 'https://api.openweathermap.org',
     validateStatus:
         (status) {
       return status! < 500;
     },
     headers:
     {
       "Accept": "*/*",
       "Content-Type": "application/json",
       "Connection": "keep-alive",
     },
     connectTimeout: 60 * 1000,
     receiveTimeout: 60 * 1000,
   )
 )..interceptors.add(LogInterceptor());

 Future<Response> request(String url, {dynamic body, required String method}) async {
  
   var res = _dio.request(url,
       data: body,
       options: Options(
           method: method,
       ));
   return res;
 }
}