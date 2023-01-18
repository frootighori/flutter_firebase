import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mysampleapp/constants/appstring.dart';
import 'package:mysampleapp/constants/apptheme.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
import 'package:mysampleapp/views/page/home/home_page.dart';
import 'package:mysampleapp/views/page/login/login_page.dart';
import 'package:mysampleapp/views/page/login/login_phonescreen.dart';
import 'package:mysampleapp/views/page/register/register.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    //
    return AdaptiveTheme(
      light: AppTheme().lightTheme(),
      dark: AppTheme().darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
         return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],

    child: MaterialApp(
          //navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
home: const AuthWrapper(),
        routes: {
          RegisterPage.routeName: (context) =>
              const RegisterPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },          theme: theme,
          darkTheme: darkTheme,
        ));
      
      });
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return  const HomePage();
    }
    return const LoginPage();
  }
}