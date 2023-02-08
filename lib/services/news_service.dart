import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:seccion17_newsapp/models/models.dart';

const _urlNews = 'newsapi.org';
const _apikey = '0c76094e4d484daa909544759639f646';
const _country = 'co';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    categories.forEach((category) {
      this.categoryArticles[category.name] = List.empty(growable: true);
    });

    getArticlesByCategory(_selectedCategory);
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesBySelectedCategory => this.categoryArticles[this._selectedCategory]!;

  getTopHeadlines() async {
    final url = Uri.https(_urlNews, 'v2/top-headlines', 
      {'apiKey': _apikey, 'country': _country});
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticlesByCategory(String category) async {

    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final url = Uri.https(_urlNews, 'v2/top-headlines', {
        'apiKey': _apikey, 
        'country': _country, 
        'category': _selectedCategory
      });
    final response = await http.get(url);

    final newsResponse = newsResponseFromJson(response.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
