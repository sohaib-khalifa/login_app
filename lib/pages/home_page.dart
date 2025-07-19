// import 'package:flutter/material.dart';
// import '../widgets/news_list_view_builder.dart';
// import '../widgets/news_stories_list.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   static final String routeName = 'HomePage';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: Colors.transparent,
//       //   elevation: 0,
//       //   title: Row(
//       //     mainAxisSize: MainAxisSize.min,
//       //     children: [
//       //       Text('News'),
//       //       Text('Cloud', style: TextStyle(color: Colors.orange)),
//       //     ],
//       //   ),
//       // ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: false,
//         title: Text(
//           'Instagram',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 32,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             onPressed: () {},
//             color: Colors.black,
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {},
//             color: Colors.black,
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),

//         child: CustomScrollView(
//           physics: BouncingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(child: SizedBox(height: 32)),
//             SliverToBoxAdapter(child: NewsStoriesList()),
//             // SliverToBoxAdapter(child: NewsListView()), --> less efficient
//             NewsListViewBuilder(category: 'general'),
//             // NewsListView() ==> because NewsListView() consider ==> SliverList
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/news_list_view_builder.dart';
import '../widgets/news_stories_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final String routeName = 'HomePage';

  Future<void> _refreshNews() async {
    await Future.delayed(Duration(seconds: 2));
    print('News refreshed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: _refreshNews,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: true,
                backgroundColor: Colors.white,
                elevation: 1,
                centerTitle: false,
                title: Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                ],
              ),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(child: NewsStoriesList()),
              NewsListViewBuilder(category: 'general'),
            ],
          ),
        ),
      ),
    );
  }
}
