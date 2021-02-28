import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay/overlay.dart';

import '../providers/quotes.dart';

class TodaysQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var latestQuote = Provider.of<Quotes>(context).latestQuote;
    return InkWell(
      onTap: () {
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
                              'Today\'s Quote',
                              style: theme.textTheme.headline6.copyWith(
                                  fontSize: 25,
                                  color: Color.fromRGBO(0, 171, 158, 1),
                                  fontStyle: FontStyle.normal),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('"$latestQuote"',
                                style: theme.textTheme.headline6.copyWith(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic)),
                          ],
                        )))));
      },
      // child: Container(
      //   height: 140,
      //   width: 170,
      //   child: Card(
      //     margin: EdgeInsets.all(10),
      //     color: Color.fromRGBO(242, 242, 242, 1),
      //     child: Padding(
      //       padding: EdgeInsets.all(8),
      //       child: Image.asset(
      //         'assets/images/quote_day_final.png',
      //         fit: BoxFit.fitWidth,
      //       ),
      //     ),
      //   ),
      // )
      child: Image.network(
        'https://www.jackcanfield.com/wp-content/uploads/2016/08/daily-affirmations.jpg',
        fit: BoxFit.cover,
        width: 1000,
      ),
    );
  }
}
