import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_sell_swap/screens/authentication/phoneauth_screen.dart';
import 'package:share_sell_swap/screens/login_screen.dart';
import 'package:share_sell_swap/screens/splash_screen.dart';
import 'dart:ui';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreen());
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: Colors.cyan.shade900, fontFamily: 'RobotoSlab'),
              home: LoginScreen(),
              routes: {
                LoginScreen.id: (context) => LoginScreen(),
                PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
              },
            );
          }
        });
  }
}
