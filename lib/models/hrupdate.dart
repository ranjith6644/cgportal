import 'package:flutter/foundation.dart';

class HRUpdate {
  final String id;
  final String title;
  final String description;
  final DateTime creationDate;
  final DateTime eventDate;

  HRUpdate(
      {@required this.id,
      @required this.title,
      @required this.creationDate,
      @required this.eventDate,
      @required this.description});
}
