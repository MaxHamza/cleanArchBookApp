import 'package:dio/dio.dart';

abstract class Failure{
  final String message;
  Failure(this.message);
}
class ServerFailure extends Failure{
  ServerFailure(super.message);
  factory ServerFailure.fromDioException(DioException e){
    switch(e.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with apiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with apiService');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with apiService');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate timeout with apiService');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(e.response!.statusCode!,e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to apiService was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an error,please try again');
    }
  }
  factory ServerFailure.badResponse(int statusCode,dynamic response){
    if(statusCode >=500){
      return ServerFailure('there is a problem with server,please try again');
    }
   else if(statusCode ==404){
      return ServerFailure('your request was not found,please try again');
    }
    else if(statusCode==400||statusCode==401||statusCode==403){
      return ServerFailure(response['error']['message']);
    }
   else{
      return ServerFailure('there was an error,please try again');
    }
  }
}