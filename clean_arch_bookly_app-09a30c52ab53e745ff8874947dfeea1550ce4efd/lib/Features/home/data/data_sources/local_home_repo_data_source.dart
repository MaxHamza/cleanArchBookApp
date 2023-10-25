import '../../domain/entities/home_entity.dart';

abstract class LocalHomeRepoDataSource{
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewestBooks();
}

class LocalHomeRepoDataSourceImp extends LocalHomeRepoDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}