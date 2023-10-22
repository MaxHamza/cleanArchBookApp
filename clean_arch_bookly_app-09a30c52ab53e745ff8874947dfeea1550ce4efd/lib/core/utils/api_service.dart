import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio;
  ApiService(this._dio);
  String baseUrl='https://www.googleapis.com/books/v1/';
 Future<Map<String,dynamic>>get(String endUrl)async{
   Response response=await _dio.get('$baseUrl$endUrl');
   return response.data;
 }

}