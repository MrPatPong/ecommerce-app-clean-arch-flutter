import 'package:ecommerce_appclean_arch_flutter/config/assets/app_vectors.dart';
import 'package:ecommerce_appclean_arch_flutter/config/theme/app_colors.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/splash_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go('/signin');
        } else if (state is Authenticated) {
          context.go('/home');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(AppVectors.applogo),
        ),
      ),
    );
  }
}
