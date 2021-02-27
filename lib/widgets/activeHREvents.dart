import 'package:cgportal/models/hrupdate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hrupdates.dart';

import './hrEvent.dart';

class ActiveHREvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hrData = Provider.of<HRUpdates>(context);
    final activeEvents = hrData.activeHREvents;
    return activeEvents.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Container(
                margin: EdgeInsets.all(50),
                alignment: Alignment.topCenter,
                height: constraints.maxHeight * 0.6,
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/nodata.png',
                  fit: BoxFit.fitWidth,
                ));
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return HrEvent(hrEventData: activeEvents[index]);
            },
            itemCount: activeEvents.length,
          );
  }
}
