import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../../domain/entities/home_entity.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCas) : super(NewestBooksInitial());
  final FetchNewestBooksUseCas fetchNewestBooksUseCas;
  Future<void>newestBooks()async{
    emit(NewestBooksLoading());
    var result=await fetchNewestBooksUseCas.call();
    result.fold((failure){
      emit(NewestBooksFailure(failure.message));
      }, (newestBooks){
      emit(NewestBooksSuccess(newestBooks));
    });
  }
}
