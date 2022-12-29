import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:mysampleapp/constants/apptheme.dart';
import 'package:mysampleapp/firebase/signinwithgoogle.dart';
import 'package:mysampleapp/views/page/splash/splash_page.dart';
import 'package:provider/provider.dart';
import 'constants/appstring.dart';

class my_app extends StatelessWidget {
  const my_app({Key? key}) : super(key: key);
//final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    //
    return AdaptiveTheme(
      light: AppTheme().lightTheme(),
      dark: AppTheme().darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) =>ChangeNotifierProvider( create:(context)=>GoogleSignInProvider(),
        child: MaterialApp(
          //navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          home: SplashScreen(),
          theme: theme,
          darkTheme: darkTheme,
        ),
      
    ));
  }
}