import 'package:dio/dio.dart';
import 'package:login_app_test/models/artical_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {
    // Future.delayed ==> of test
    // return await Future.delayed(Duration(seconds: 10), ()async {

    try {
      var response = await dio.get(
        'https://gnews.io/api/v4/top-headlines?category=$category&lang=ar&country=eg&apikey=c13c315fb881e89ddfb63ed4353ca3f3',
        //  this is our API ==> 'https://gnews.io/api/v4/top-headlines?category=$category&lang=ar&country=eg&apikey=c13c315fb881e89ddfb63ed4353ca3f3',
      );
      //https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=5f00b5be1b7b4df8be98fbb18be83fff
      //https://gnews.io/api/v4/top-headlines?category=general&lang=ar&country=eg&apikey=c13c315fb881e89ddfb63ed4353ca3f3

      Map<String, dynamic> jsonData = response.data;
      // print(jsonData);
      // print(jsonData["totalArticles"]);
      // print(jsonData["articles"]);
      // List<dynamic> articles = jsonData["articles"];
      // print(articles);

      // Exception
      // List<Map<String, dynamic>> articles =
      //     jsonData["articles"] as List<Map<String, dynamic>>;
      //     print(articles);
      //=============
      //     if (jsonData['status'] != 'ok') {
      // throw Exception(jsonData['message'] ?? 'Unknown error');
      // }
      List<dynamic> articles = jsonData["articles"];
      // for (var article in articles) {
      //  print(article);
      //  print(article["publishedAt"]);

      //   print(article["source"]);
      // }
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        // ArticleModel articleModel = ArticleModel(
        //   image: article['image'],
        //   title: article['title'],
        //   subTitle: article['description'],
        //   //// source: Source(
        //   ////   name: article['source']['name'],
        //   ////   url: article['source']['url'],
        //   //// ),
        // );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }

    // });  // ==>  close of Future.delayed
    // var ==> when used make sure that response is not future
  }
}
