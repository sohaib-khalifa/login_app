import 'package:flutter/material.dart';
import 'package:login_app_test/widgets/news_list_view_builder.dart';

// import 'package:news_app/widgets/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final String routeName = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News'),
            Text('Cloud', style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            // SliverToBoxAdapter(child: NewsListView()), --> less efficient
            NewsListViewBuilder(category: 'general'),
            // NewsListView() ==> because NewsListView() consider ==> SliverList
          ],
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     children: [
      //       CategoriesListView(),
      //       const SizedBox(height: 32),
      //       Expanded(child: NewsListView()),
      //     ],
      //   ),
      // ),
    );
  }
}
