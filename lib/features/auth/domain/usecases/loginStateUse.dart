import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/repositories/authRepo.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class LoginStateUse implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepo>().logInState();
  }
}
