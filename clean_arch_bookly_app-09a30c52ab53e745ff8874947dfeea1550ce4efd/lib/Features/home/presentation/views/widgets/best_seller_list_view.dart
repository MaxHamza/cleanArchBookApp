import 'package:flutter/material.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: BookListViewItem(),
    );
  }
}
