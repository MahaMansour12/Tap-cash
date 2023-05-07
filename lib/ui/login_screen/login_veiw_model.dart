


import 'dart:html';

import 'package:tap_cash_money/shard/base_view_model.dart';


import '../../api/repo/auth_implement/auth_repo_mpl.dart';
import '../../api/repo/auth_implement/datasoure_impl.dart';
import 'login_navigator.dart';
import 'package:tap_cash_money/api/api_manger.dart';
class LoginViewModel extends BaseViewModel<LoginNavigator> {
 late authI_repository_mplement AuthImplement;
 late RepoDataSourceImplement remotDataSourse;
 late apiManger ApiManger;
  LoginViewModel(){
    ApiManger =apiManger();
    AuthImplement=authI_repository_mplement(remotDataSourse);
    remotDataSourse=RepoDataSourceImplement(ApiManger);
  }
 Future<void> login(String phone,String password) async {
   navigator?.showProgressDialog( '  Loading',);
   try{
     var token =await AuthImplement.login(phone,password);
     navigator?.hideDialog();
     if(token==null){
       navigator?.showMessage( "Error \n",posActionTitle: 'OK');
       print(token);
       return;

     }
     navigator?.hideDialog();
     navigator?.showMessage(token,posActionTitle: 'OK');
   }catch(e){

     navigator?.hideDialog();
     navigator?.showProgressDialog( "Error \t \n"+e.toString());
     print(e.toString());
   }
 }

}