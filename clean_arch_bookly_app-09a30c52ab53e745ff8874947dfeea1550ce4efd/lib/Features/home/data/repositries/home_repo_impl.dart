import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repositries/home_repo.dart';
import 'package:bookly/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/local_home_repo_data_source.dart';
import '../data_sources/remote_home_repo_data_source.dart';

class HomeRepoImpl extends HomeRepo{
  final LocalHomeRepoDataSourceImp localHomeRepoDataSourceImp;
  final RemoteHomeRepoDataSourceImp remoteHomeRepoDataSourceImp;
  HomeRepoImpl({required this.localHomeRepoDataSourceImp,required this.remoteHomeRepoDataSourceImp});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async{
    List<BookEntity>books;
    try{
      books=localHomeRepoDataSourceImp.fetchFeaturedBooks();
      if(books.isNotEmpty){
        return right(books);
      }
       books=await remoteHomeRepoDataSourceImp.fetchFeaturedBooks();
      return right(books);
    }
    catch(e){
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    List<BookEntity>books;
    try{
     books=localHomeRepoDataSourceImp.fetchNewestBooks();
      if(books.isNotEmpty){
        return right(books);
      }
      books=await remoteHomeRepoDataSourceImp.fetchNewestBooks();
      return right(books);
    }
    catch(e){
      return left(Failure());
    }
  }

}