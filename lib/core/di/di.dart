import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/core/networking/dio_factory.dart';
import 'package:task1intern/features/auth/login/data/repo/login_repo.dart';
import 'package:task1intern/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:task1intern/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:task1intern/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:task1intern/features/profile/data/repo/profile_repo.dart';
import 'package:task1intern/features/profile/logic/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
//Api Service

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );

//login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//sign up

  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

//profile

  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
}

// Dio createAndSetUpDio() {
//   Dio dio = Dio();
//   dio
//     ..options.connectTimeout = const Duration(seconds: 30)
//     ..options.receiveTimeout = const Duration(seconds: 30);

//   dio.interceptors.add(LogInterceptor(
//     error: true,
//     requestBody: true,
//     request: true,
//     responseBody: true,
//     requestHeader: false,
//     responseHeader: false,
//   ));
//   return dio;
// }
