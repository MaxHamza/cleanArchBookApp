import 'package:bloc/bloc.dart';
import '../../../domain/entities/home_entity.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCas) : super(FeaturedBooksInitial());
 final FetchFeaturedBooksUseCas featuredBooksUseCas;

 Future<void>featuredBooks()async{
 emit(FeaturedBooksLoading());
var result=await  featuredBooksUseCas.call();
  result.fold((failure){
    emit(FeaturedBooksFailure(failure.message));
  },(books){
    emit(FeaturedBooksSuccess(books));
  });
}


}
