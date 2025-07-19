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
      drawer: const MyCustomDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshNews,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: true,
              floating: true,
              centerTitle: true,
              title: const Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              actions: const [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: null,
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: null,
                  color: Colors.black,
                ),
              ],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
            const SliverToBoxAdapter(child: NewsStoriesList()),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/3.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'صهيب هشام',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                'LoginPage',
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
