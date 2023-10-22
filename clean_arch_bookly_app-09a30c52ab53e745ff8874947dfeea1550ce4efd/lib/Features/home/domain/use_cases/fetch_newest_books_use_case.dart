import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../entities/home_entity.dart';
import '../repositries/home_repo.dart';

class FetchNewestBooksUseCas extends UseCase<List<BookEntity>,void>{
  final HomeRepo homeRepo;
  FetchNewestBooksUseCas(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async{
    return await homeRepo.fetchNewestBooks();
  }
}

abstract class UseCase<Type,Param>{
  Future<Either<Failure, Type>>call([Param param]);
}