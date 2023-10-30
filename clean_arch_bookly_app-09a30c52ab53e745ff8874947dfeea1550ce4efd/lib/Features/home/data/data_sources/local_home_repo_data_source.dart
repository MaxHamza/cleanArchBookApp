import 'package:bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/home_entity.dart';

abstract class LocalHomeRepoDataSource{
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewestBooks();
}

class LocalHomeRepoDataSourceImp extends LocalHomeRepoDataSource{
  @override
 List<BookEntity>fetchFeaturedBooks(){
    var box=Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
   var box=Hive.box<BookEntity>(kNewestBox);
   return box.values.toList();
  }

}