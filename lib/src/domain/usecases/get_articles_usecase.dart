import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usercase.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call(
      {required ArticlesRequestParams params}) {
    return _articlesRepository.getBreakingNewsArticles(params);
  }
}
