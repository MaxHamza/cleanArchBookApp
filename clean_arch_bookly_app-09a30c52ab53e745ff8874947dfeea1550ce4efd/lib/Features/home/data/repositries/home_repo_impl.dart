import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repositries/home_repo.dart';
import 'package:bookly/core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/local_home_repo_data_source.dart';
import '../data_sources/remote_home_repo_data_source.dart';

class HomeRepoImpl extends HomeRepo{
  final LocalHomeRepoDataSource localHomeRepoDataSource;
  final RemoteHomeRepoDataSource remoteHomeRepoDataSource;
  HomeRepoImpl({required this.localHomeRepoDataSource,required this.remoteHomeRepoDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async{
    List<BookEntity>books;
    try{
      books=await localHomeRepoDataSource.fetchFeaturedBooks();
      if(books.isNotEmpty){
        return right(books);
      }
       books=await remoteHomeRepoDataSource.fetchFeaturedBooks();
      return right(books);
    }
    catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    List<BookEntity>books;
    try{
     books=localHomeRepoDataSource.fetchNewestBooks();
      if(books.isNotEmpty){
        return right(books);
      }
      books=await remoteHomeRepoDataSource.fetchNewestBooks();
      return right(books);
    }
    catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}