import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as authentication;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAuth {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String name, String email, String password);

  Future<authentication.User> getCurrentUser();

  Future<void> signOut();
}

class Auth with ChangeNotifier implements BaseAuth {
  final authentication.FirebaseAuth _firebaseAuth =
      authentication.FirebaseAuth.instance;

  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;
  String _userName;

  Future<void> signIn(String email, String password) async {
    try {
      authentication.UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      authentication.User user = result.user;
      var authUser = await user.getIdTokenResult();
      _token = authUser.token;
      _userId = user.uid;
      _expiryDate = authUser.expirationTime;
      _userName = user.displayName;
      notifyListeners();
      _autoLogout();
      updateLocalStorage();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateLocalStorage() async {
    final localStorage = await SharedPreferences.getInstance();
    final userData = json.encode({
      'userName': _userName,
      'token': _token,
      'userId': _userId,
      'expiryDate': _expiryDate.toIso8601String()
    });
    localStorage.setString('localUserData', userData);
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      authentication.UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print('test data:: $result');
      authentication.User user = result.user;
      user.updateProfile(displayName: name);
      var authUser = await user.getIdTokenResult();
      _token = authUser.token;
      print(user);
      _userId = user.uid;
      _expiryDate = authUser.expirationTime;
      _userName = name;
      addCustomerName(_userName, _userId, _token);
      notifyListeners();
      _autoLogout();
      updateLocalStorage();
    } catch (error) {
      throw error;
    }
  }

  Future<authentication.User> getCurrentUser() async {
    authentication.User user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> signup(String email, String password, String userName) async {
    // return returns the future from Authenticate and waits for service response
    _userName = userName;
    // return _authenticate(email, password, "signUp");
    return signUp(_userName, email, password);
  }

  Future<void> login(String email, String password) async {
    //return _authenticate(email, password, "signInWithPassword");
    return signIn(email, password);
  }

  Future tryAutoLogin() async {
    // return getCurrentUser();
    final localStorage = await SharedPreferences.getInstance();
    if (!localStorage.containsKey('localUserData')) {
      return false;
    }
    final localUserData = json.decode(localStorage.getString('localUserData'))
        as Map<String, Object>;
    final expiryDate = DateTime.parse(localUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = localUserData['token'];
    _expiryDate = DateTime.parse(localUserData['expiryDate']);
    _userId = localUserData['userId'];
    _userName = localUserData['userName'];
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    signOut();
    _token = null;
    _userId = null;
    _expiryDate = null;
    _userName = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    //prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> addCustomerName(
      String name, String userId, String authToken) async {
    final url =
        'https://cgportal-e7860-default-rtdb.firebaseio.com//users/$userId.json?auth=$authToken';
    // the return returns the future of then operation.
    try {
      await http.post(
        url,
        body: json.encode({
          'userName': name,
          'userId': userId,
          'creationDate': DateTime.now().toIso8601String()
        }),
      );
    } catch (error) {
      print(error);
      throw error;
    }
  }

  String get userName {
    return _userName;
  }

  Future<void> resetPassword(String emailId) async {
    await _firebaseAuth.sendPasswordResetEmail(email: emailId);
  }
}
