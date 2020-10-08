import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/core/datasource/remote/dio/api_result.dart';
import 'package:flutter_setup/core/datasource/remote/exceptions/network_exceptions.dart';
import 'package:flutter_setup/feature/post/data/model/post_response.dart';
import 'package:flutter_setup/feature/post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
            onPressed: () {
              getPostList();
            },
            child: Text('Press'),
          ),
        ));
  }

  void getPostList() async {
    ApiResult<List<Post>> apiResult =
        await Provider.of<PostProvider>(context, listen: false).getPostList();
    apiResult.when(success: (List<Post> data) {
      print(data[1].bannerTitle);
    }, failure: (NetworkExceptions error) {
      print(NetworkExceptions.getErrorMessage(error));
    });
  }
}
