import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/article_request.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/usecases/get_articles_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetArticlesUseCase _getArticlesUseCase;
  PostBloc(this._getArticlesUseCase) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final List<Article> _articles = [];
  int _page = 1;
  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _getArticlesUseCase(
            params: ArticlesRequestParams(page: _page));
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts.data,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Article>> _fetchPosts([int startIndex = 0]) async {
    final response =
        await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));
    if (response is DataSuccess && response.data!.isNotEmpty) {
      final articles = response.data;
      _articles.addAll(articles!);
      _page++;
      return response.data!;
    }
    throw Exception('error fetching posts');
  }
}
