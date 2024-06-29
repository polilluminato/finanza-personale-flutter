import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finanza_personale/models/book_model.dart';
import 'package:finanza_personale/provider/service_locator.dart';

class BookRepository {
  final dio = getIt<Dio>();

  Future<List<BookModel>?> getBookList() async {
    Response response = await dio.get(
        "https://raw.githubusercontent.com/polilluminato/finanza-personale-flutter/main/data/books.json");

    final responseBodyParsed =
        json.decode(response.data) as Map<String, dynamic>;

    return responseBodyParsed["books"]
        .map<BookModel>((json) => BookModel.fromJson(json))
        .toList();
  }
}
