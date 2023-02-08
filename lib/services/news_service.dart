import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:seccion17_newsapp/models/models.dart';

const _urlNews = 'newsapi.org';
const _apikey = '0c76094e4d484daa909544759639f646';
const _country = 'co';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(_urlNews, 'v2/top-headlines', 
      {'apiKey': _apikey, 'country': _country});
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }
}
