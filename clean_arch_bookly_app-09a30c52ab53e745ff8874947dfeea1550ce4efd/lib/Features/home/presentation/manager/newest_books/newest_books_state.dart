part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}
class NewestBooksInitial extends NewestBooksState {}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksFailure extends NewestBooksState {
  final String message;
  NewestBooksFailure(this.message);
}
class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity>books;
  NewestBooksSuccess(this.books);
}