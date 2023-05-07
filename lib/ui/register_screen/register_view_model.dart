


import 'package:flutter/foundation.dart';
import 'package:tap_cash_money/shard/base_navigator.dart';
import 'package:tap_cash_money/shard/base_view_model.dart';
import 'package:tap_cash_money/ui/register_screen/register_navigator.dart';

import '../../custom_widgets/dialog_utils.dart';

import '../login_screen/login_navigator.dart';
import 'package:tap_cash_money/api/api_manger.dart';

class RegisterViewModel extends BaseViewModel <RegisterNavigator>{

   void register(String name, String phone,String NID,
       String age, String gender, String address, String password) async {
     navigator?.showProgressDialog( '  Loading');
     try{
       var respnse =await apiManger.register(
           name: name,
           phone: phone,
           NId: NID,
           age: age,
           gender: gender,
           address: address,
           password: password);

       navigator?.showMessage("Error \n"+respnse.message,posActionTitle: 'OK');
       print(respnse.message);

       // Navigator.hideDialog(context);
       navigator?.showMessage(respnse.message,posActionTitle: 'OK');
     }catch(e){

       navigator?.hideDialog();
       navigator?.showProgressDialog("Error \t \n"+e.toString());
       print(e.toString());
     }
   }
}