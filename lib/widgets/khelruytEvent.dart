import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/khelruytupdate.dart';

class KhelruytEvent extends StatelessWidget {
  const KhelruytEvent({
    Key key,
    @required KhelruytUpdate khelruytEventData,
  })  : _khelruytEventInfo = khelruytEventData,
        super(key: key);

  final KhelruytUpdate _khelruytEventInfo;

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
          _khelruytEventInfo.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_khelruytEventInfo.eventDate),
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
