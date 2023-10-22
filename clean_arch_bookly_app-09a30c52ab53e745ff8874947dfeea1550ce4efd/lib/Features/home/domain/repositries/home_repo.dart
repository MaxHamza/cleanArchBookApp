import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookEntity>>>fetchNewestBooks();
}