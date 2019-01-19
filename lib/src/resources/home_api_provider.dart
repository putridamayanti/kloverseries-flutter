import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:kloverseries_app/src/models/home_model.dart';

class HomeApiProvider {
  Client client = Client();
  final _baseUrl = 'https://kloverseries.com/api/home';


}