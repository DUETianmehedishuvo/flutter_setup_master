
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/data/datasource/remote/dio/dio_client.dart';
import 'package:tutorial/data/datasource/remote/exception/api_error_handler.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/util/app_constant.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> login({String userName, String password}) async {
    try {
      final response = await dioClient.get('Userinfs/hridoy@asit.com.bd/9963dcf7f7917baa754a6d97502bca49');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences.setString(AppConstant.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstant.TOKEN) ?? "";
  }

  Future<ApiResponse> heatForGetToken() async {
    try {
      final response = await dioClient.get('${AppConstant.jwt_token_uri}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
