import 'package:flutter_clean_architecture/src/core/params/article_request.dart';
import 'package:flutter_clean_architecture/src/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params);
}
