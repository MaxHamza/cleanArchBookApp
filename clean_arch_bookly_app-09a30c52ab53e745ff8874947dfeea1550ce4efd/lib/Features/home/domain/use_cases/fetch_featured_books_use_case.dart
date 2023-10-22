import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repositries/home_repo.dart';
import 'package:bookly/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCas extends UseCase<List<BookEntity>,void>{
 final HomeRepo homeRepo;
  FetchFeaturedBooksUseCas(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async{
  return await homeRepo.fetchFeaturedBooks();
  }
}

abstract class UseCase<Type,Param>{
  Future<Either<Failure, Type>>call([Param param]);
}