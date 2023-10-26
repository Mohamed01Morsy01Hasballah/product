import 'package:dio/dio.dart';

class  DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
          baseUrl: 'http://127.0.0.1:8000/api/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String ?token

})async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'Authorization':'Bearer $token',


    };

    return await dio!.get(
      url,
      queryParameters: query
    );
  }
  static Future<Response> SendData(
  {
    required String url,
   required Map<String,dynamic> query,
      Map<String,dynamic>? data,
    String? token
}
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'Authorization':'Bearer $token',


    };

    return await dio!.post(
        url,
      data:data,
      queryParameters: query
    );
  }
}