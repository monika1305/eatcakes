import 'dart:convert';
import 'dart:io';

import 'package:eatcakes/model/cake.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../api/apiexception.dart';
import 'baseservice.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cakeservice {

  // Future<List<Cake>> fetchMovies(String keyword) async {
  //
  //   final url = "http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538";
  //   final response = await http.get(Uri.parse(url));
  //   print('response ----------------- $response');
  //   if(response.statusCode == 200) {
  //
  //     final body = jsonDecode(response.body);
  //     final Iterable json = body["Search"];
  //     return json.map((movie) => Cake.fromJson(movie)).toList();
  //
  //   } else {
  //     throw Exception("Unable to perform request!");
  //   }
  // }
}