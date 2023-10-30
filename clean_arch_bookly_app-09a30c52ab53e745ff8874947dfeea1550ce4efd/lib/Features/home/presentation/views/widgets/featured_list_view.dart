import 'package:flutter/material.dart';
import '../../../domain/entities/home_entity.dart';
import 'custom_book_item.dart';
class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.length, required this.books});
 final int length;
 final List<BookEntity>books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
  height: MediaQuery.of(context).size.height * .3,
  child: ListView.builder(
   itemCount: length,
  scrollDirection: Axis.horizontal,
  itemBuilder: (context, index) {
  return  Padding(
  padding: EdgeInsets.symmetric(horizontal: 8),
  child: CustomBookImage(image:books[index].image ),
  );
  }),
  );
  }
  }

