import 'package:flutter/foundation.dart';

class Word {
  final String addedBy;
  final String word;
  final String meaning;
  final DateTime creationDate;

  Word({
    this.addedBy,
    @required this.word,
    @required this.meaning,
    @required this.creationDate,
  });
}
