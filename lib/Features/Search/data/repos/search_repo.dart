import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName});
}
