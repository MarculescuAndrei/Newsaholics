import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsaholic/Models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b56292e3dc6f463097f708300172ed1e";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=="ok") {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && element["description"]!=null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            //publishedAt: element["publishedAt"],
            content: element["content"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}