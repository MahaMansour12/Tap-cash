import 'package:flutter/material.dart';
import 'package:tap_cash_money/ui/login_screen/login_screen.dart';
import 'package:tap_cash_money/ui/register_screen/register_screen.dart';

import '../../custom_widgets/customButtom.dart';

class TapCashMain extends StatelessWidget {
   static const String routName=' TapCashMain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/backGround.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Image.asset(
            'assets/images/TAB CASH.png',
            height: MediaQuery.of(context).size.height * 0.47,
          ),
          Image.asset('assets/images/LOGO.png',
              height: MediaQuery.of(context).size.height * 0.76),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              InkWell(
                  onTap: () {
                         Navigator.pushReplacementNamed(context, LoginScreen.routName);
                  },
                  child: CustomButtom('LOG IN')),
              SizedBox(
                height: 38,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RegisterScreen.routName);
                  },
                  child: CustomButtom('CREATE ACCOUNT')),
            ],
          )
        ],
      ),
    );
  }


}

