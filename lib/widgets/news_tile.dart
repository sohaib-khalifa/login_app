import 'package:flutter/material.dart';
import 'package:login_app_test/models/artical_model.dart';
import 'package:login_app_test/pages/web_view_page.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/views/web_view_screen.dart'; // web view

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    // Inkwell ==> becuase web view
    return InkWell(
      onTap: () {
        if (articleModel.url != null) {
          // ✅ شرط: نتأكد إن فيه رابط قبل الفتح
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => WebViewScreen(
                    url: articleModel.url!,
                  ), // ✅ فتح صفحة WebView مع تمرير الرابط
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:
                  articleModel.image != null
                      ? Image(
                        image: NetworkImage(articleModel.image!),

                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                      : SizedBox(
                        height: 200,
                        width: double.infinity,

                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 100,
                          color: Colors.grey.shade300,
                        ),
                      ),
            ),
            const SizedBox(height: 12),
            Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articleModel.subTitle ?? 'No description available',

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/*            ما هو الفرق بين كل من 
             fit: BoxFit.cover,
             fit: BoxFit.fill,
 */
