
import 'dart:convert';
import 'dart:io';

import 'package:eatcakes/model/services/baseservice.dart';
import 'package:eatcakes/model/services/cakeservice.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'api/apiexception.dart';
import 'cake.dart';

class CakeRepository {
  String baseUrl =
      "https://jsonplaceholder.typicode.com/posts";
  //
  // Future<Cake> fetchAlbum() async {
  //   final response = await http.get(baseUrl as Uri);
  //
  //   if (response.statusCode == 200) {
  //     return Cake.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load ');
  //   }
  // }

}