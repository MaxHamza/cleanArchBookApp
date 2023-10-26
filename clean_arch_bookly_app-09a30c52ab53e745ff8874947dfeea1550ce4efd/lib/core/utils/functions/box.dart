import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../Features/home/domain/entities/home_entity.dart';
import '../../../constants.dart';

void addToBox(List<BookEntity> books,String kFeaturedBooks) {
  var box=Hive.box<BookEntity>(kFeaturedBox);
  box.addAll(books);
}