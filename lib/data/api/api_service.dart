import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_about_technology/data/model/article.dart';

class ApiService {
  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2022-07-19&to=2022-07-19&sortBy=popularity&apiKey=f79b3c5f13c44b9a91339f54ab7717dc'));

    // final response = await http.get(Uri.parse(
    //     _baseUrl+'everything?q='+_category+'&from='+_date+'&sortBy='+_sortBy+'&apiKey='+_apiKey));

    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
