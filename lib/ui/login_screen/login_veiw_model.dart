


import 'package:tap_cash_money/shard/base_view_model.dart';


import 'login_navigator.dart';
import 'package:tap_cash_money/api/api_manger.dart';
class LoginViewModel extends BaseViewModel<LoginNavigator> {


 Future<void> login(String phone,String password) async {
   navigator?.showProgressDialog( '  Loading',);
   try{
     var respnse =await apiManger.login(

         phone:phone,
         password: password);
     if(respnse.message!=null){
       navigator?.showMessage( "Error \n"+respnse.message,posActionTitle: 'OK');
       print(respnse.message);
       return;

     }
     navigator?.hideDialog();
     navigator?.showMessage(respnse,posActionTitle: 'OK');
   }catch(e){

     navigator?.hideDialog();
     navigator?.showProgressDialog( "Error \t \n"+e.toString());
     print(e.toString());
   }
 }

}