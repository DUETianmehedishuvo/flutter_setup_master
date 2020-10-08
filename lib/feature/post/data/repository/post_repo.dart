import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/core/datasource/remote/dio/api_result.dart';
import 'package:flutter_setup/core/datasource/remote/dio/dio_client.dart';
import 'package:flutter_setup/core/datasource/remote/exceptions/network_exceptions.dart';
import 'package:flutter_setup/feature/post/data/model/post_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPre;

  PostRepo({@required this.dioClient, @required this.sharedPre});

  Future<ApiResult<List<Post>>> getPostList() async {
    try {
      final response = await dioClient.post('bannerList');
      List<Post> dataList = PostResponse.fromJson(response).dataInfo;
      return ApiResult.success(data: dataList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
