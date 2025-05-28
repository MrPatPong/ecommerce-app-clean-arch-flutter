import 'package:flutter/material.dart';

class EmailPasswordFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const EmailPasswordFields({super.key, 
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration:  const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
      ],
    );
  }
}
