import 'package:bookly/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';
class FeaturedBooksListViewWithBloc extends StatelessWidget {
const FeaturedBooksListViewWithBloc({super.key});

@override
Widget build(BuildContext context) {
  return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
    builder:(context, state){
      if(state is FeaturedBooksSuccess){
        return  FeaturedBooksListView(length: state.books.length,books: state.books,);
      }
      else if(state is FeaturedBooksFailure){
        return  Padding(padding:const EdgeInsets.all(10),child: Text(state.failure),);
      }
      else{
        return const Center(child: CircularProgressIndicator(),);
      }
    },
  );
}
}
