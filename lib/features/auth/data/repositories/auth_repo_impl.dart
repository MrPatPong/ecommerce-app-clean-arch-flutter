import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_creation_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_login_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/auth.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class AuthRepoImpl extends AuthRepo {

  @override
  Future<Either> signup(UserCreationReq user) async{
    return sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> login(UserloginReq user) async{
    return sl<AuthFirebaseService>().login(user);
  }
}
