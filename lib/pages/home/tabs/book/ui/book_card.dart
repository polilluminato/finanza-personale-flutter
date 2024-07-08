import 'package:extended_image/extended_image.dart';
import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/styles/dimens.dart';
import 'package:finanza_personale/utils/utils.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.smallPadding,
              ),
              child: ExtendedImage.network(
                book.cover,
                fit: BoxFit.cover,
                width: getScreenWidth(context) * 0.3,
                cache: true,
                //cancelToken: cancellationToken,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.smallPadding,
              ),
              child: Text(
                book.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
