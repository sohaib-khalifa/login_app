import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_app_test/models/artical_model.dart';
import 'package:login_app_test/services/news_services.dart';
import 'package:login_app_test/widgets/error_massage.dart';
import 'package:login_app_test/widgets/news_list_view.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/services/news_services.dart';
// import 'package:news_app/widgets/error_massage.dart';
// import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category; 
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleModel> articles = [];
  var future;
  @override
  void initState() {
    future = NewsServices(Dio()).getTopHeadLines(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,

            child: Center(
              child: ErrorMassage(
                message: 'No news available, try again later.',
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: const Center(child: LoadingIndicator()),
          );
        }
      },
    );
    // return isLoading
    //     ? SliverFillRemaining(
    //       hasScrollBody: false,
    //       child: const Center(child: CircularProgressIndicator()),
    //     )
    //     : articles.isNotEmpty
    //     ? NewsListView(articles: articles)
    //     : SliverFillRemaining(
    //       hasScrollBody: false,

    //       child: Center(child: Text('No news available, try again later.')),
    //     );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Colors.orange.shade500.withGreen(300).withAlpha(200),
      strokeWidth: 5,
    );
  }
}
