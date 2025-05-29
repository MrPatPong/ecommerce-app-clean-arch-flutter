import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_creation_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class SignupUsecase implements Usecase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepo>().signup(params!);
  }
}
