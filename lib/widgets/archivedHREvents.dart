import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hrupdates.dart';
import '../widgets/hrEvent.dart';

class ArchivedHREvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hrupdateData = Provider.of<HRUpdates>(context);
    final archiveHREvents = hrupdateData.archiveHREvents;
    return archiveHREvents.isEmpty
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
              return HrEvent(hrEventData: archiveHREvents[index]);
            },
            itemCount: archiveHREvents.length,
          );
  }
}
