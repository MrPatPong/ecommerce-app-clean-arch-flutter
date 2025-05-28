import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/pages/signin.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/pages/signup.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/pages/splash_page.dart';
import 'package:ecommerce_appclean_arch_flutter/homepage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
        GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) =>  Signin(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) =>  Signup(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) =>  const Homepage(),
    ),
  ],
);