


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:WordWideNews/src/models/category_model.dart';
import 'package:WordWideNews/src/models/news_model.dart';

// ignore: non_constant_identifier_names
final _APIKEY = '44fa1292cb3d42e084490229d27d69e6';

// ignore: non_constant_identifier_names
final CODE = 'ar';

class NewsService with ChangeNotifier {
  
  String _catSelect = 'general';
  
  bool _isLoading = true;
  
  List<Category> categorias = [
    Category(FontAwesomeIcons.star, 'general'),
    Category(FontAwesomeIcons.chartBar, 'business'),
    Category(FontAwesomeIcons.film, 'entertainment'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  
  Map<String, List<Article>> categoryArticles= {};
  
  NewsService() {
    categorias.forEach((item) {
    
      this.categoryArticles[item.nombre] = new List();  
    });
    
    this.getArticlesByCategory(this._catSelect);
  }
  // Getter y Setter
  
  bool get isLoading => this._isLoading;
  
  
  get catSelect => this._catSelect;
  set catSelect(String valor) {
    
    this._catSelect = valor;
    this._isLoading = true;
    
    this.getArticlesByCategory(valor);
    
    notifyListeners();
  }
  
  List<Article> get getArticle => this.categoryArticles[this.catSelect];  
  
  
  getArticlesByCategory(String categoria) async{
    
    // Primero el Singelton
    if (this.categoryArticles[categoria].length > 0) {
      
      this._isLoading = false;
      notifyListeners();
      
      return this.categoryArticles[categorias];
      
    }
    
    final url = 'https://newsapi.org/v2/top-headlines?country=$CODE&apiKey=$_APIKEY&pageSize=100&category=$categoria';
    
    final resp = await http.get(url);
    
    final newsResponse = newsResponseFromJson(resp.body);
    
    this.categoryArticles[categoria].addAll(newsResponse.articles);
    
    this._isLoading = false;
    notifyListeners();
    
  }  
  
}