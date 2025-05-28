import 'package:ecommerce_appclean_arch_flutter/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signin.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {

  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //repo
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());

  //usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SignInUsecase>(SignInUsecase());
}