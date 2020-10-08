import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/core/datasource/remote/dio/api_result.dart';
import 'package:flutter_setup/feature/post/data/model/post_response.dart';
import 'package:flutter_setup/feature/post/data/repository/post_repo.dart';

class PostProvider extends ChangeNotifier {
  final PostRepo postRepo;

  PostProvider({@required this.postRepo});

  Future<ApiResult<List<Post>>> getPostList() async {
    return postRepo.getPostList();
  }
}
