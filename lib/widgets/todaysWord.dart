import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay/overlay.dart';

import '../providers/dailyWords.dart';

class TodaysWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var latestQuote = Provider.of<DailyWords>(context).todaysWord;
    var wordMeaning = Provider.of<DailyWords>(context).wordMeaning;
    return InkWell(
      splashColor: Colors.cyan,
      splashFactory: InkRipple.splashFactory,
      onTap: () {
        // Using overlayWidget
        CustomOverlay(
            context: context,
            // Using overlayWidget
            overlayWidget: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              '$latestQuote',
                              style: theme.textTheme.headline6.copyWith(
                                  fontSize: 25,
                                  color: Color.fromRGBO(0, 171, 158, 1),
                                  fontStyle: FontStyle.normal),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('"$wordMeaning"',
                                style: theme.textTheme.headline6.copyWith(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic)),
                          ],
                        )))
                        ));
      },

      child: Image.network(
        'https://www.worldbyisa.com/wp-content/uploads/2019/11/words.png',
        fit: BoxFit.cover,
        width: 1000,
      ),
    );
  }
}
