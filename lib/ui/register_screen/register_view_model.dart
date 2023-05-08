


import 'package:flutter/foundation.dart';
import 'package:tap_cash_money/shard/base_navigator.dart';
import 'package:tap_cash_money/shard/base_view_model.dart';
import 'package:tap_cash_money/ui/register_screen/register_navigator.dart';


import 'package:tap_cash_money/api/api_manger.dart';

import '../../api/repo/auth_implement/auth_repo_mpl.dart';
import '../../api/repo/auth_implement/datasoure_impl.dart';

class RegisterViewModel extends BaseViewModel <RegisterNavigator>{
  late authI_repository_mplement AuthImplement;
  late RepoDataSourceImplement remotDataSourse;
  late apiManger ApiManger;
  RegisterViewModel(){
    ApiManger =apiManger();
    AuthImplement=authI_repository_mplement(remotDataSourse);
    remotDataSourse=RepoDataSourceImplement(ApiManger);
  }
   void register(String name, String phone,String NID,
       String age, String gender, String address, String password) async {
     navigator?.showProgressDialog( '  Loading');
     try{
       var respnse =await remotDataSourse.register(name, phone, age, gender, NID, address, password);

        if(respnse==null)

       navigator?.showMessage('unable to create account',posActionTitle: 'OK');
     }catch(e){

       navigator?.hideDialog();
       navigator?.showProgressDialog("Error \t \n"+e.toString());
       print(e.toString());
     }
   }
}