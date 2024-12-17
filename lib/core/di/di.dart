import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/auth/login/data/repo/login_repo.dart';
import 'package:task1intern/features/auth/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//Api Service

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(createAndSetUpDio()),
  );

//login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    request: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
