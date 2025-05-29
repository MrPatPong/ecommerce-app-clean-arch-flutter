import 'package:bloc/bloc.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/loginStateUse.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/splash_state.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashScreen());

  void openApp() async {
    await Future.delayed(const Duration(seconds: 4));
    var loginstate = await sl<LoginStateUse>().call();
    if (loginstate) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }

  }
}
