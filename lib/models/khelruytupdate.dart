import 'package:flutter/foundation.dart';

class KhelruytUpdate {
  final String id;
  final String title;
  final String description;
  final DateTime creationDate;
  final DateTime eventDate;

  KhelruytUpdate(
      {@required this.id,
      @required this.title,
      @required this.creationDate,
      @required this.eventDate,
      @required this.description});
}
