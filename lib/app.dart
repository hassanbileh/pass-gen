import 'package:flutter/material.dart';
import 'package:passgen/constants/assets/assets_constants.dart';
import 'package:passgen/screens/add_password/add_password.dart';
import 'package:passgen/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        )
      ),
      initialRoute: '/',
      routes: {
        Assets.registerRoute:(context) => const RegisterScreen(),
        Assets.resetPassordRoute:(context) => const ResetPassword(),
        Assets.loginRoute:(context) => const LoginScreen(),
        Assets.homeRoute:(context) => const NavScreen(),
        Assets.newPasswordRoute: (context) => const NewPassword(),
      },
      home: const OnBoardingScreen(),
    );
  }
}
