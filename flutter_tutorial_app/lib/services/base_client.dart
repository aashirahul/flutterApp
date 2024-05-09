import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_tutorial_app/models/post.dart';



class BaseClient {
 Future<dynamic> get(String api) async {
  var client = http.Client();

  var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  final response = await client.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
 }
}