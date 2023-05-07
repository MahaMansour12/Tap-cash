import 'package:flutter/material.dart';

import '../../model/login/Login_respons.dart';
import '../../model/register/Register_respons.dart';

abstract class AuthRepo {
  Future<String?> login(String phone, String password);
  Future<String?> register(String name, String phone, String age, String gender,
      String nid, String address, String password);
}
abstract class RepoDataSource{
  Future<LoginRespons?> login(String phone, String password);
  Future<RegisterRespons?> register(String name, String phone, String age, String gender,
      String nid, String address, String password);
}
