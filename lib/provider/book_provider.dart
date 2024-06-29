import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/repository/book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_provider.g.dart';

final bookRepositoryProvider = Provider((_) => BookRepository());

@riverpod
Future<List<BookModel>?> bookList(BookListRef ref) async {
  final bookRepository = ref.watch(bookRepositoryProvider);
  return bookRepository.getBookList();
}
