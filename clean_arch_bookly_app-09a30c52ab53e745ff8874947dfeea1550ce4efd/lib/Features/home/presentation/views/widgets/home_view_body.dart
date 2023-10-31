import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'fetch_featured_books_with_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
      physics:const BouncingScrollPhysics(),
      slivers: [
       const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListViewWithBloc(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
       SliverList(
         delegate: SliverChildBuilderDelegate((context, index){
          return const Padding(
         padding:EdgeInsets.symmetric(horizontal: 30),
         child:BestSellerListView(),
          );
         },
           childCount: 10
       ),
       )
      ],
    );
  }
  }
