import 'package:flutter/material.dart';
import 'package:login_app_test/widgets/story_viewer.dart';
 class NewsStoriesList extends StatelessWidget {
  const NewsStoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/2.jpg',
      'assets/images/1.jpg',
      'assets/images/3.jpg',
      'assets/images/1.jpg',
      'assets/images/2.jpg',
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) => StoryViewer(
                    stories: stories,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(stories[index]),
                  ),
                  SizedBox(height: 6),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


