import 'package:flutter/material.dart';
import 'package:tap_cash_money/api/api_manger.dart';
import '../../custom_widgets/customButtom.dart';
import '../../custom_widgets/customForm.dart';
import '../../custom_widgets/dialog_utils.dart';
import '../home/home_screen.dart';
import '../tapCashMian/tapCashMain.dart';

class LoginScreen extends StatelessWidget {
  static const String routName='LoginScreen';
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/backGround.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, TapCashMain.routName);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  const Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff1E1C1C),
                        fontWeight: FontWeight.w400,
                        fontSize: 42),
                  ),
                  const Text(
                    'ON       BOARD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff1E1C1C),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            customForm(
                              keyboard: TextInputType.phone,
                              'Phone Number',
                              Icon(Icons.phone, color: Colors.black),
                              'Enter your number',
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter phone number';
                                }
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            customForm(
                                'Password',
                                Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                keyboard: TextInputType.visiblePassword,
                                'Enter your password',
                                controller: passwordController,
                                obscure: true, validator: (pass) {
                              if (pass?.trim() == "") {
                                return "Please enter password";
                              }
                              // final bool passVaild = RegExp(
                              //         "({(?=.*[a-z])(?=.*[A-Z]).{8,}}|{(?=.*[A-Z])(?!.*\\s).{8,}})")
                              //     .hasMatch(pass!);
                              return null;
                            }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            InkWell(
                                onTap: () {
                                  ValidateForm(context);
                                }, child: CustomButtom('LOG IN')),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              'Forget Password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  )
                ]),
          ))
    ]);
  }

  void ValidateForm(context) async {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    DialogUtils.showProgressDialog(context, '  Loading');
    try{
      var respnse =await apiManger.login(

          phone: phoneController.text,
          password: passwordController.text);
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
      if(respnse.message!=null){
        DialogUtils.showMessage(context, "Error \n"+respnse.message,posActionTitle: 'OK');
        print(respnse.message);
        return;

      }
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context,respnse,posActionTitle: 'OK');
    }catch(e){

      DialogUtils.hideDialog(context);
      DialogUtils.showProgressDialog(context, "Error \t \n"+e.toString());
      print(e.toString());
    }
  }

}
