import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants.dart';
import '../../../injector.dart';
import '../posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kAppName)),
      body: BlocProvider<PostBloc>(
        create: (_) => injector()..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
