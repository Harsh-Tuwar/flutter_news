import 'dart:convert';

import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News {
  	List<ArticleModel> news = [];

	Future<void> getNews() async {
		String apiURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=aadb7c33ba8744caa8e5ea3c0590b68f";
		var response = await http.get(Uri.parse(apiURL));
		var jsonData = jsonDecode(response.body);

		if (jsonData['status'] == 'ok') {
			jsonData['articles'].forEach((ele) {
				if (ele['urlToImage'] != null && ele['description'] != null) {
					ArticleModel articleModel = ArticleModel(
						title: ele['title'],
						author: ele['author'],
						url: ele['url'],
						urlToImage: ele['urlToImage'],
						content: ele['content'],
						description: ele['description']
					);

					news.add(articleModel);
				}
			});
		}
	}
}

class CategoryNews {
  	List<ArticleModel> news = [];

	Future<void> getCategoryNews(String category) async {
		String apiURL = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=aadb7c33ba8744caa8e5ea3c0590b68f";
		var response = await http.get(Uri.parse(apiURL));
		var jsonData = jsonDecode(response.body);

		if (jsonData['status'] == 'ok') {
			jsonData['articles'].forEach((ele) {
				if (ele['urlToImage'] != null && ele['description'] != null) {
					ArticleModel articleModel = ArticleModel(
						title: ele['title'],
						author: ele['author'],
						url: ele['url'],
						urlToImage: ele['urlToImage'],
						content: ele['content'],
						description: ele['description']
					);

					news.add(articleModel);
				}
			});
		}
	}
}