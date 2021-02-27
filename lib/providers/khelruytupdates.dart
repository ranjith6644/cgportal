import 'dart:convert';
import 'dart:io';

import 'package:cgportal/models/khelruytupdate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../providers/auth.dart';

class KhelruytUpdates with ChangeNotifier {
  List<KhelruytUpdate> _khelruytUpdatesList = [];
  String authToken;
  String userId;

  update(Auth auth) {
    authToken = auth.token;
    userId = auth.userId;
  }

  List<KhelruytUpdate> get activeKhelruytEvents {
    return _khelruytUpdatesList.where((list) {
      return list.eventDate.isAfter(DateTime.now());
    }).toList();
  }

  List<KhelruytUpdate> get archiveKhelruytEvents {
    return _khelruytUpdatesList.where((list) {
      return list.eventDate.isBefore(DateTime.now());
    }).toList();
  }

// Method to Add New HR Update
  Future<void> addNewKhelruytEvent(
      String title, String description, DateTime eventDate) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/khelruytupdates.json?auth=$authToken';
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
      final _newKhelruytEvent = KhelruytUpdate(
        id: json.decode(response.body)['id'],
        title: title,
        description: description,
        eventDate: json.decode(response.body)['eventDate'],
        creationDate: json.decode(response.body)['creationDate'],
      );
      _khelruytUpdatesList.add(_newKhelruytEvent);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteKhelruytEvent(String id) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/khelruytupdates/$id.json?auth=$authToken';
    final deletedItemIndex =
        _khelruytUpdatesList.indexWhere((element) => element.id == id);
    var deletedItem = _khelruytUpdatesList[deletedItemIndex];
    // Removing the item from memory.
    _khelruytUpdatesList.removeAt(deletedItemIndex);
    notifyListeners();

    await http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        throw HttpException('Cannot delete Hr update..!!');
      }
      // Delete operation succeed we empty the item, Dart will clean up
      deletedItem = null;
    }).catchError((_) {
      // will be executed incase delete call fails and the transaction will be kept back to memory
      _khelruytUpdatesList.insert(deletedItemIndex, deletedItem);
      notifyListeners();
    });
  }

  Future<void> fetchAndShowData() async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com/khelruytupdates.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<KhelruytUpdate> loadedKhelruytUpdates = [];
      extractedData.forEach((hreventId, hrEventsData) {
        loadedKhelruytUpdates.add(KhelruytUpdate(
            id: hreventId,
            title: hrEventsData['title'],
            description: hrEventsData['description'],
            eventDate: DateTime.parse(hrEventsData['eventDate']),
            creationDate: DateTime.parse(hrEventsData['creationDate'])));
      });
      _khelruytUpdatesList = loadedKhelruytUpdates;
      print(_khelruytUpdatesList);
      notifyListeners();
    } catch (error) {}
  }
}
