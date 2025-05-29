import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_state.dart';
import 'package:ecommerce_appclean_arch_flutter/common/widgets/app_button.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_login_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signinUse.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

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

                context.go('/home'); // Navigate to home page after success
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sign In', style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),
                    emailField(context),
                    const SizedBox(height: 20),
                    passwordField(context),
                    const SizedBox(height: 20),
                    loginButton(context),
                    const SizedBox(height: 20),
                    signupButton(context),
                    const SizedBox(height: 20),
                    forgetPasswordButton(context),
                  ],
                ),
              ),
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

  Widget passwordField(BuildContext context) {
    return TextField(
      controller: passwordCon,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Builder(builder: (context) {
      return AppButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
                usecase: SignInUsecase(),
                params: UserloginReq(
                    email: emailCon.text, password: passwordCon.text),
              );
          // Handle sign up logic here
        },
        title: 'login',
      );
    });
  }

  Widget signupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/signup'); // Navigate to signup page
      },
      child: const Text('Sign Up'),
    );
  }

  Widget forgetPasswordButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'forgot Password?',
        style: const TextStyle(color: Colors.white, fontSize: 14),
        children: [
          TextSpan(
            text: ' reset ',
            style: const TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.go('/resetpass'); // Navigate to forgot password page
              },
          ),
        ],
      ),
    );
  }
}
