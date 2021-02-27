import 'dart:convert';

import 'package:flutter/material.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;

import '../models/quote.dart';

class Quotes with ChangeNotifier {
  List<Quote> _quoteInfo = [];
  String authToken;
  update(Auth auth) {
    authToken = auth.token;
  }

  List<Quote> get quoteList {
    return [..._quoteInfo];
  }

  String get latestQuote {
    var length = _quoteInfo.length - 1;
    return _quoteInfo[length].quoteDetail;
  }

  List<String> get quote {
    List<String> quotes = [];
    for (int i = 0; i < _quoteInfo.length; i++) {
      quotes.add(_quoteInfo[i].quoteDetail);
    }
    return quotes;
  }

  Future<void> getQuotes() async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/dailyQuotes.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      print('Get Quotes triggered');
      final List<Quote> quote = [];
      extractedData.forEach((quoteId, quoteData) {
        print(quoteData['addedBy']);
        quote.add(Quote(
            addedBy: quoteData['addedBy'],
            quoteDetail: quoteData['quoteDetail'],
            creationDate: DateTime.parse(quoteData['creationDate'])));
      });
      _quoteInfo = quote;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> addNewQuote(
      String name, String quoteDetail, DateTime creationDate) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/dailyQuotes.json?auth=$authToken';
    // the return returns the future of then operation.
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'addedBy': name,
          'quoteDetail': quoteDetail,
          'creationDate': creationDate.toIso8601String(),
        }),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
