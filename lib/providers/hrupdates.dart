import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/hrupdate.dart';
import '../models/http_exception.dart';
import '../providers/auth.dart';

class HRUpdates with ChangeNotifier {
  List<HRUpdate> _hrUpdatesList = [];
  String authToken;
  String userId;

  update(Auth auth) {
    authToken = auth.token;
    userId = auth.userId;
  }

  List<HRUpdate> get activeHREvents {
    return _hrUpdatesList.where((list) {
      return list.eventDate.isAfter(DateTime.now());
    }).toList();
  }

  List<HRUpdate> get archiveHREvents {
    return _hrUpdatesList.where((list) {
      return list.eventDate.isBefore(DateTime.now());
    }).toList();
  }

// Method to Add New HR Update
  Future<void> addNewHRUpdate(
      String title, String description, DateTime eventDate) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/hrupdates.json?auth=$authToken';
    // the return returns the future of then operation.
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': title,
          'description': description,
          'eventDate': eventDate.toIso8601String(),
          'creationDate': DateTime.now().toIso8601String()
        }),
      );
      final _newHrEvent = HRUpdate(
        id: json.decode(response.body)['id'],
        title: title,
        description: description,
        eventDate: json.decode(response.body)['eventDate'],
        creationDate: json.decode(response.body)['creationDate'],
      );
      _hrUpdatesList.add(_newHrEvent);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteHREvent(String id) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/hrupdates/$id.json?auth=$authToken';
    final deletedItemIndex =
        _hrUpdatesList.indexWhere((element) => element.id == id);
    var deletedItem = _hrUpdatesList[deletedItemIndex];
    // Removing the item from memory.
    _hrUpdatesList.removeAt(deletedItemIndex);
    notifyListeners();

    await http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        throw HttpException('Cannot delete Hr update..!!');
      }
      // Delete operation succeed we empty the item, Dart will clean up
      deletedItem = null;
    }).catchError((_) {
      // will be executed incase delete call fails and the transaction will be kept back to memory
      _hrUpdatesList.insert(deletedItemIndex, deletedItem);
      notifyListeners();
    });
  }

  Future<void> fetchAndShowData() async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/hrupdates.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<HRUpdate> loadedHRUpdates = [];
      extractedData.forEach((hreventId, hrEventsData) {
        loadedHRUpdates.add(HRUpdate(
            id: hreventId,
            title: hrEventsData['title'],
            description: hrEventsData['description'],
            eventDate: DateTime.parse(hrEventsData['eventDate']),
            creationDate: DateTime.parse(hrEventsData['creationDate'])));
      });
      _hrUpdatesList = loadedHRUpdates;
      print(_hrUpdatesList);
      notifyListeners();
    } catch (error) {}
  }
}
