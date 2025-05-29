import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_state.dart';
import 'package:ecommerce_appclean_arch_flutter/common/widgets/app_button.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/resetPassUse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Resetpasspage extends StatelessWidget {
  Resetpasspage({super.key});
  final TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ButtonStateCubit()),
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonStateFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    behavior: SnackBarBehavior.floating));
              } else if (state is ButtonStateSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message ?? ''),
                    behavior: SnackBarBehavior.floating));
                context.go(
                    '/emailsentreset'); // Navigate to Email Sent Notification page after success
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      context.go('/signin'); // Navigate to sign in page
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Reset Password',
                            style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 20),
                        emailField(context),
                        const SizedBox(height: 20),
                        resetButton(context)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField(BuildContext context) {
    return TextField(
      controller: emailCon,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget resetButton(BuildContext context) {
    return Builder(builder: (context) {
      return AppButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: ResetPasswordUsecase(),
                  params: emailCon.text,
                );
          },
          title: 'Reset Password');
    });
  }
}
