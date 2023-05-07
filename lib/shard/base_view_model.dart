import 'package:flutter/material.dart';
import 'package:tap_cash_money/shard/base_navigator.dart';

class BaseViewModel <Nav extends BaseNavigator>extends ChangeNotifier{
  Nav? navigator;

}