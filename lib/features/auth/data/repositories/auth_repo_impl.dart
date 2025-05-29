import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_creation_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_login_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class AuthRepoImpl extends AuthRepo {

  @override
  Future<Either> signup(UserCreationReq user) async{
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> login(UserloginReq user) async{
    return await sl<AuthFirebaseService>().login(user);
  }

  @override
  Future<Either> resetPassword(String email) async{
    return await sl<AuthFirebaseService>().resetPassword(email);
  }

  @override
  Future<bool> logInState() async{
    return await sl<AuthFirebaseService>().logInState();
  }
}
