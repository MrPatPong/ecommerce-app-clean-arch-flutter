import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class ResetPasswordUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<AuthRepo>().resetPassword(params!);

  }
}