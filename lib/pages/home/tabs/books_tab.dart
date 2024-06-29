import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/provider/asyncvalue_widget.dart';
import 'package:finanza_personale/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksTab extends ConsumerWidget {
  const BooksTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);

    return AsyncValueWidget<List<BookModel>?>(
      value: bookList,
      data: (data) {
        return ListView.builder(
          itemCount: data!.length,
          itemBuilder: (_, int index) {
            return Text(data[index].title);
          },
        );
      },
    );
  }
}
