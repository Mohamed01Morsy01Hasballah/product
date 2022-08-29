import 'package:dio/dio.dart';

class  DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query

})async{
    return await dio!.get(
      url,
      queryParameters: query
    );
  }
  static Future<Response> SendData(
  {
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data
}
      )async{
    return await dio!.post(
        url,
      data:data,
      queryParameters: query
    );
  }
}