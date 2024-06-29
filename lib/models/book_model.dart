// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required String id,
    required String title,
    required String author,
    required String cover,
    required String link,
    required String published,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) =>
      _$BookModelFromJson(json);
}
