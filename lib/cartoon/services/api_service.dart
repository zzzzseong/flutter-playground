import 'dart:convert';

import 'package:flutter_playground/cartoon/models/cartoon_detail_model.dart';
import 'package:flutter_playground/cartoon/models/cartoon_episode_model.dart';
import 'package:flutter_playground/cartoon/models/cartoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<CartoonModel>> getTodayCartoons() async {
    final response = await http.get(Uri.parse('$baseUrl/$today'));

    List<CartoonModel> cartoonList = [];
    if(response.statusCode == 200) {
      for (var json in jsonDecode(response.body)) {
        final CartoonModel model = CartoonModel.fromJson(json);
        cartoonList.add(model);
      }

      return cartoonList;
    }

    throw Error();
  }

  static Future<CartoonDetailModel> getCartoonById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CartoonDetailModel.fromJson(json);
    }

    throw Error();
  }

  static Future<List<CartoonEpisodeModel>> getLastEpisodeById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/episodes'));

    List<CartoonEpisodeModel> episodeList = [];
    if(response.statusCode == 200) {
      for (var episode in jsonDecode(response.body)) {
        final CartoonEpisodeModel model = CartoonEpisodeModel.fromJson(episode);
        episodeList.add(model);
      }

      return episodeList;
    }

    throw Error();
  }
}