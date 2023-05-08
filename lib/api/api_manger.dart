import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/login/LoginRequst.dart';
import 'model/register/Register_Rquest.dart';


class apiManger {
  static String baseUrlRegister = 'ewallet-api-f9fm.onrender.com';
  static String endPointRegister = 'register';
  static String endPointLogin = 'login';


      register(
        { required String name,
          required String phone,
          required String NId,
          required String age,
          required  String gender,
          required String address,
          required String password })async{
      RegisterRequest registerbody= RegisterRequest(
          name:name,
          phone:phone,
          nid:NId,
          age:age,
          gender:gender,
          address:address,
          password: password
      );
      var url=Uri.https(baseUrlRegister,endPointRegister);
      var response= await http.post(url,body: registerbody.toJson());
      return  RegisterRequest.fromJson(jsonDecode(response.body));
    }

   login(
        { required String phone,
          required String password })async{
      var register= requst_login(password: password,phone: phone) ;
      var url=Uri.https(baseUrlRegister,endPointLogin);
      var response= await http.post(url,body: register.toJson());
      return  requst_login.fromJson(jsonDecode(response.body));
    }





}
