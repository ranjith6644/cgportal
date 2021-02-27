import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/hrupdate.dart';

class HrEvent extends StatelessWidget {
  const HrEvent({
    Key key,
    @required HRUpdate hrEventData,
  })  : _hrEventInfo = hrEventData,
        super(key: key);

  final HRUpdate _hrEventInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        title: Text(
          _hrEventInfo.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_hrEventInfo.eventDate),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          color: Theme.of(context).accentColor,
          onPressed: () {},
        ),
      ),
    );
  }
}
