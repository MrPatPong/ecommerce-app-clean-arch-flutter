import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_creation_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_login_req.dart';

abstract class AuthRepo {

  Future<Either> signup(UserCreationReq user);
  Future<Either> login(UserloginReq user);

}