import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_btn.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          if (bookModel.accessInfo?.pdf?.downloadLink != null)
            Expanded(
              child: CustomBtn(
                onPressed: () {
                  launchCustomUrl(
                      context, bookModel.accessInfo?.pdf?.downloadLink);
                },
                textBtn: 'Download',
                fontSize: 16,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
              ),
            ),
          Expanded(
            child: CustomBtn(
              onPressed: () async {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              },
              fontSize: 16,
              textBtn: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: bookModel.accessInfo?.pdf?.downloadLink == null
                  ? BorderRadius.circular(16.0)
                  : const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Preview Not Aviliable';
    } else {
      return 'Preview';
    }
  }
}
