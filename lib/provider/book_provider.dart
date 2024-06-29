import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/repository/book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_provider.g.dart';

@riverpod
Future<List<BookModel>?> bookList(BookListRef ref) async {
  return BookRepository().getBookList();
}
