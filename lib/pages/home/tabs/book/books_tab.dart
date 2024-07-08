import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/pages/home/tabs/book/ui/book_card.dart';
import 'package:finanza_personale/provider/asyncvalue_widget.dart';
import 'package:finanza_personale/provider/book_provider.dart';
import 'package:finanza_personale/styles/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BooksTab extends ConsumerWidget {
  const BooksTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookList = ref.watch(bookListProvider);

    return AsyncValueWidget<List<BookModel>?>(
      value: bookList,
      data: (data) {
        return MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: Dimens.tinyMargin,
          crossAxisSpacing: Dimens.tinyMargin,
          itemCount: data!.length,
          itemBuilder: (_, int index) {
            return BookCard(book: data[index]);
          },
        );
      },
    );
  }
}
