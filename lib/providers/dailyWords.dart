import 'dart:convert';

import 'package:flutter/material.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;

import '../models/word.dart';

class DailyWords with ChangeNotifier {
  List<Word> _dailyWords = [];
  String authToken;
  update(Auth auth) {
    authToken = auth.token;
  }

  List<Word> get wordsList {
    return [..._dailyWords];
  }

  String get todaysWord {
    var length = _dailyWords.length - 1;
    return _dailyWords[length].word;
  }

  String get wordMeaning {
    var length = _dailyWords.length - 1;
    return _dailyWords[length].meaning;
  }

  Future<void> getDailyWords() async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/dailyWords.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Word> word = [];
      extractedData.forEach((wordId, wordData) {
        word.add(Word(
            addedBy: wordData['addedBy'],
            word: wordData['word'],
            meaning: wordData['meaning'],
            creationDate: DateTime.parse(wordData['creationDate'])));
      });
      _dailyWords = word;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> addNewDailyWord(String name, String word, String meaning) async {
    print('daily word triggered');
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/dailyWords.json?auth=$authToken';
    // the return returns the future of then operation.
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'addedBy': name,
          'word': word,
          'meaning': meaning,
          'creationDate': DateTime.now().toIso8601String(),
        }),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
