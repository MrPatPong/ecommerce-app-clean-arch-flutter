import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_state.dart';
import 'package:ecommerce_appclean_arch_flutter/common/widgets/app_button.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/data/models/user_creation_req.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/domain/usecases/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();

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
                
                context.go('/signin'); // Navigate to sign in page after success
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
                        const Text('Sign Up', style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 20),
                        emailField(context),
                        const SizedBox(height: 20),
                        passwordField(context),
                        const SizedBox(height: 20),
                        nameField(context),
                        const SizedBox(height: 20),
                        lastNameField(context),
                        const SizedBox(height: 20),
                        signupButton(context)
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

  Widget passwordField(BuildContext context) {
    return TextField(
      controller: passwordCon,
      obscureText: false,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget nameField(BuildContext context) {
    return TextField(
      controller: nameCon,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget lastNameField(BuildContext context) {
    return TextField(
      controller: lastNameCon,
      decoration: const InputDecoration(
        labelText: 'Last Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget signupButton(BuildContext context) {
    return Builder(builder: (context) {
      return AppButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: SignupUsecase(),
                  params: UserCreationReq(
                      firstName: nameCon.text,
                      lastName: lastNameCon.text,
                      email: emailCon.text,
                      password: passwordCon.text),
                );
            // Handle sign up logic here
          },
          title: 'Sign Up');
    });
  }
}
