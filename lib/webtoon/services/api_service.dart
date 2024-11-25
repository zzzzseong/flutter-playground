import 'dart:convert';

import 'package:flutter_playground/webtoon/models/cartoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<CartoonModel>> getTodayCartoons() async {
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
}