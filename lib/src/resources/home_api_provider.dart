import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:kloverseries_app/src/models/item_model.dart';

final Logger log = new Logger('HomeApiProvider');

class HomeApiProvider {
  
  Client client = Client();
  final _apiKey = '74d2b9d100753279b2762ed08c4edd05';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchHomeList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}