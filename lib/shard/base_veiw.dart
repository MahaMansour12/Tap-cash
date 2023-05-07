import 'package:flutter/cupertino.dart';
import 'package:tap_cash_money/shard/base_navigator.dart';

import 'base_view_model.dart';

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel() ;
  @override
  initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  hideDialog() {
    // TODO: implement hideDialog
    throw UnimplementedError();
  }

  @override
  showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    // TODO: implement showMessage
    throw UnimplementedError();
  }

  @override
  showProgressDialog(String message) {
    // TODO: implement showProgressDialog
    throw UnimplementedError();
  }
}

@override
hideDialog() {}

@override
showMessage(String message,
    {String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
    bool isDismissible = true}) {}

@override
showProgressDialog(String message) {}
