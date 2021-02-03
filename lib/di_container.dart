import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_ael/data/datasource/remote/dio/dio_client.dart';
import 'package:ecommerce_ael/data/repository/auth_repo.dart';
import 'package:ecommerce_ael/data/repository/onboarding_repo.dart';
import 'package:ecommerce_ael/data/repository/splash_repo.dart';
import 'package:ecommerce_ael/helper/network_info.dart';
import 'package:ecommerce_ael/provider/auth_provider.dart';
import 'package:ecommerce_ael/provider/localization_provider.dart';
import 'package:ecommerce_ael/provider/onboarding_provider.dart';
import 'package:ecommerce_ael/provider/splash_provider.dart';
import 'package:ecommerce_ael/provider/theme_provider.dart';
import 'package:ecommerce_ael/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));

  // Provider
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
