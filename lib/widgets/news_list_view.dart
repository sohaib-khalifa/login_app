import 'package:flutter/material.dart';
import 'package:login_app_test/models/artical_model.dart';
import 'package:login_app_test/widgets/news_tile.dart';
// import 'package:news_app/models/article_model.dart';

// import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  //// void initState() async { ==> exception
  ////   super.initState();
  ////   articles = await NewsServices(Dio()).getNews();
  //// }

  @override
  Widget build(BuildContext context) {
    ////  NewsServices(Dio()).getNews(); ==> There is no need to put a method inside the build method.
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return NewsTile(articleModel: articles[index]);
      }),
    );
    //// return ListView.builder(
    ////   shrinkWrap: true, // less efficient
    ////   physics: NeverScrollableScrollPhysics(),
    ////   itemCount: 10,
    ////   itemBuilder: (context, index) {
    ////     return NewsTile();
    ////   },
    //// );
  }
}
