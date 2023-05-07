import 'package:flutter/material.dart';
import 'package:tap_cash_money/ui/home/home_screen.dart';
import 'package:tap_cash_money/ui/login_screen/login_screen.dart';
import 'package:tap_cash_money/ui/register_screen/register_screen.dart';
import 'package:tap_cash_money/ui/tapCashMian/tapCashMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute:  TapCashMain.routName ,
      routes: {
        TapCashMain.routName :(context)=>TapCashMain(),
        RegisterScreen.routName:(context)=>RegisterScreen(),
        LoginScreen.routName :(context)=>LoginScreen(),
        HomeScreen.routName:(context)=>HomeScreen()
      },
    );
  }
}
