import 'package:bloc/bloc.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashScreen());

  void openApp() async {
    await Future.delayed(const Duration(seconds: 4));
    emit(Unauthenticated());
  }
}
