import '../../domain/entities/article.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    int? id,
    required SourceModel source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          id: id ?? 0,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] ?? '-',
      title: map['title'] ?? '-',
      description: map['description'] ?? '-',
      url: map['url'] ?? '2',
      urlToImage: map['urlToImage'] ?? '-',
      publishedAt: map['publishedAt'] ?? '-',
      content: map['content'] ?? '-',
    );
  }
}
