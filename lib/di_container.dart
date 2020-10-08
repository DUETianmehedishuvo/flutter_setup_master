import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_setup/core/datasource/remote/dio/dio_client.dart';
import 'package:flutter_setup/core/utill/app_constants.dart';
import 'package:flutter_setup/feature/post/data/repository/post_repo.dart';
import 'package:flutter_setup/feature/post/provider/post_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl()));

  // Repository
  sl.registerLazySingleton(
    () => PostRepo(dioClient: sl(), sharedPre: sl()),
  );

  // Provider
  sl.registerFactory(
    () => PostProvider(postRepo: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
