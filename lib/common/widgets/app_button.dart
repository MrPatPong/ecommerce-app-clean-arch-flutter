import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  const AppButton(
      {required this.onPressed,
      this.title = '',
      this.height,
      this.width,
      this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
      if (state is ButtonStateLoading) {
        return loading();
      }
      return initial();
    });
  }

  Widget loading() {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        child: Container(
            height: height ?? 50,
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }

  Widget initial() {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
          // maximumSize: Size.fromWidth(width ?? 150),
        ),
        child: content ??
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ));
  }
}
