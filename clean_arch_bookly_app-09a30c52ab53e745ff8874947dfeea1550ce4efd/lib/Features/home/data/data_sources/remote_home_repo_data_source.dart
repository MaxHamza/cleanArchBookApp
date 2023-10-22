import 'package:bookly/Features/home/domain/entities/home_entity.dart';

abstract class RemoteHomeRepoDataSource{
  Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>>fetchNewestBooks();
}

class RemoteHomeRepoDataSourceImp implements RemoteHomeRepoDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {

    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    throw UnimplementedError();
  }

}