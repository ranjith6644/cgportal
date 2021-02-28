import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    Key key,
    @required String title,
    @required String description,
    @required String eventDate,
  })  : _title = title,
        _description = description,
        _eventDate = eventDate,
        super(key: key);
  final String _title;
  final String _description;
  final String _eventDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Event Title: $_title'),
          Text('Event Date: $_eventDate'),
          Text('$_description')
        ],
      ),
    );
  }
}
