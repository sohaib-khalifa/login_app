class ArticleModel {
  final String? image; // to safe from NULL
  final String title; // at normal can't be NULL
  final String? subTitle; // to safe from NULL
  final String? url; // تم تعديل ال موديل عشان هنعمل web view
  // final Source source;

  ArticleModel({
    // required this.source,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['image'],
      title: json['title'],
      subTitle: json['description'],
      url: json["url"], // تم اضافته بردوا عشان web view
    );
  }
}

// class Source {
//   final String name;
//   final String url;

//   Source({required this.name, required this.url});
// }
