import 'dart:ui';

abstract class BaseNavigator{
  showProgressDialog(String message);
  showMessage( String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDismissible = true
      });
  hideDialog();
}