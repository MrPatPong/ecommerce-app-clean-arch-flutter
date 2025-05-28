import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_appclean_arch_flutter/config/routes/routes.dart';
import 'package:ecommerce_appclean_arch_flutter/config/theme/app_theme.dart';
import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/splash_cubit.dart';
import 'package:ecommerce_appclean_arch_flutter/firebase_options.dart';
import 'package:ecommerce_appclean_arch_flutter/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();
  runApp(DevicePreview(
    backgroundColor: Colors.grey[850],
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..openApp(),
        ),
      ],
      child: MaterialApp.router(
        // routes: {
        //   '/signin': (context) => const Signin(),
        // },
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
