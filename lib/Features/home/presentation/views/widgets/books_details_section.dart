import 'package:bookly/Features/home/presentation/views/widgets/books_description.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_actions.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imgUrl: book.volumeInfo.imageLinks?.thumbnail,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.volumeInfo.title ?? '',
          style: Styles.textStyly30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyly18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          bookModel: book,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksDescription(bookModel: book),
      ],
    );
  }
}
