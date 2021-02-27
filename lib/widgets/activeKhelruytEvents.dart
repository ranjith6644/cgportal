import 'package:cgportal/providers/khelruytupdates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './khelruytEvent.dart';

class ActiveKhelruytEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final khelruytData = Provider.of<KhelruytUpdates>(context);
    final activeEvents = khelruytData.activeKhelruytEvents;
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
              return KhelruytEvent(khelruytEventData: activeEvents[index]);
            },
            itemCount: activeEvents.length,
          );
  }
}
