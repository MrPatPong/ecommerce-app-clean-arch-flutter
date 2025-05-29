import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Emailsentresetpages extends StatelessWidget {
  Emailsentresetpages({super.key});
  final TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('sent reset email',
                        style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),
                    backToSignIn(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backToSignIn(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/signin');
      },
      child: const Text('Back to Sign In'),
    );
  }
}
