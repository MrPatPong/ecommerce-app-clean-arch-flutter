import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_login_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class SignInUsecase implements Usecase<Either, UserloginReq> {
  @override
  Future<Either> call({UserloginReq ? params}) async {
    return await sl<AuthRepo>().login(params!);
  }
}