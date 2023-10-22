class BookEntity{
  final String bookId;
  final String ?image;
  final String ?author;
  final String title;
  final num ?price;
  final num ?rating;
  BookEntity({required this.image,required this.author,required this.title,required this.price,required this.rating,required this.bookId});
}