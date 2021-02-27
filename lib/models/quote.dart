import 'package:flutter/foundation.dart';

class Quote {
  final String addedBy;
  final String quoteDetail;
  final DateTime creationDate;

  Quote({
     this.addedBy,
    @required this.quoteDetail,
    @required this.creationDate,
  });
}
