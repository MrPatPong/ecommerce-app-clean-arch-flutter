import 'package:ecommerce_appclean_arch_flutter/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/loginStateUse.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/resetPassUse.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signinUse.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signupUse.dart';
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
  sl.registerSingleton<ResetPasswordUsecase>(ResetPasswordUsecase());
  sl.registerSingleton<LoginStateUse>(LoginStateUse());

}