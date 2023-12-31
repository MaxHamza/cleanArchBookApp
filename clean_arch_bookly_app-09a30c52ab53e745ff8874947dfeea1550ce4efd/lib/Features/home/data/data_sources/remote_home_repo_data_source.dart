import 'package:bookly/Features/home/data/models/Book_model.dart';
import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/utils/functions/box.dart';

abstract class RemoteHomeRepoDataSource{
  Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>>fetchNewestBooks();
}

class RemoteHomeRepoDataSourceImp implements RemoteHomeRepoDataSource{
  final ApiService apiService;
  RemoteHomeRepoDataSourceImp(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async{
    List<BookEntity>books=await getMap('volumes?q=subject:programming&Filtering=free-ebooks');
    addToBox(books,kFeaturedBox);
    return books;
  }
  @override
  Future<List<BookEntity>> fetchNewestBooks()async{
    List<BookEntity>newestBooks=await
    getMap('volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest');
    addToBox(newestBooks,kNewestBox);
    return newestBooks;
  }
  Future<List<BookEntity>> getMap(String endPoint) async {
    List<BookEntity> books=[];
    var  data=await apiService.get(endPoint);
    for(var element in data['items'] ){
      books.add(BookModel.fromJson(element));
    }
    return books;
  }

}