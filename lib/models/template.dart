import 'package:flutter/foundation.dart';

class Template {
  final String templateDescription;
  final String templateName;
  final DateTime creationDate;

  Template({
     this.creationDate,
    @required this.templateName,
    @required this.templateDescription,
  });
}
