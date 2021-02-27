import 'dart:convert';

import 'package:cgportal/models/template.dart';
import 'package:flutter/material.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;

import '../models/template.dart';

class Templates with ChangeNotifier{
  List<Template> _templatesList = [];
  List<Template> getTemplates()  {
    return _templatesList =  [
      Template(
          templateName: 'WFH Template',
          templateDescription: 'This is a template to be raised when you want to work from home'
      ),
      Template(
          templateName: 'Work from office Template',
          templateDescription: 'This is a template to be raised when you want to work from Office'
      ),
      Template(
          templateName: 'Cab Request Template',
          templateDescription: 'This is a template to be raised when you want to utilize the Office cab for commute'
      ),
      Template(
          templateName: 'Sodexo Template',
          templateDescription: 'This is a template to be raised when you want to Opt in/out for Sodexo cards'
      )
    ];
  }
}
