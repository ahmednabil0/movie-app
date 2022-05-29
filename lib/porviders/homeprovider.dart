import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  final String apikey = "bff844fc34760662951d1e38c1301428";
  HomeProvider() {
    getAllData();
  }
  List<Movie> list = [];
  List<Movie> list2 = [];
  List<Movie> list3 = [];
  Future<void> getdata(int pagenum) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=$pagenum');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    if (pagenum == 1) {
      for (var i in responseBody["results"]) {
        list.add(Movie.fromMap(i));
      }
    }
    if (pagenum == 2) {
      for (var i in responseBody["results"]) {
        list2.add(Movie.fromMap(i));
      }
    }
    if (pagenum == 3) {
      for (var i in responseBody["results"]) {
        list3.add(Movie.fromMap(i));
      }
    }
  }

  Future<String> getkey(int id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apikey&language=en-US');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    return responseBody['results'][0]['key'];
  }

  Future<void> getAllData() async {
    await getdata(1);
    await getdata(2);
    await getdata(3);
    notifyListeners();
  }
}
