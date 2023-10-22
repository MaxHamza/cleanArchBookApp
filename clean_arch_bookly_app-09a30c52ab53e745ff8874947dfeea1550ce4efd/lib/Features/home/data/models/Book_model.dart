import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';

class BookModel extends BookEntity {
  BookModel({
      this.kind, 
      this.id, 
      this.etag, 
      this.selfLink, 
      this.volumeInfo, 
      this.saleInfo, 
      this.accessInfo}):super(image:volumeInfo?.imageLinks?.thumbnail??'',price: 0.0,bookId: id!,author:volumeInfo?.authors?.first,rating: 0,title: volumeInfo?.title??'');

 factory BookModel.fromJson(Map<String,dynamic> json) {
   return BookModel(
    kind : json['kind'],
    id : json['id'],
    etag : json['etag'],
    selfLink : json['selfLink'],
    volumeInfo : json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null,
    saleInfo : json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
    accessInfo : json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null,
   );
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    return map;
  }

}