import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';

class CustomDialog {
  static void showLoading(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(),
                ],
              ),
            ),
          ),
        ),
      );

  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  static void showMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: ColorManager.red,
      textColor: ColorManager.white,
    );
  }
}
