import 'package:eatcakes/model/services/cakeservice.dart';
import 'package:eatcakes/viewmodel/cakeviewmodels.dart';
import 'package:flutter/material.dart';

class CakeListViewModel extends ChangeNotifier {

  List<CakeViewModels> _movies = <CakeViewModels>[];
  List<CakeViewModels> get lists =>_movies;

  // Future<void> fetchMovies(String keyword) async {
  //   final results =  await Cakeservice().fetchMovies(keyword);
  //   this._movies = results.map((item) => CakeViewModels(cake: item)).toList();
  //   notifyListeners();
  // }

}