import 'package:flutter/material.dart';

class AppToast {
  static void showError(context, msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 180, right: 20, left: 20),
      content: Text(
        msg,
        style: const TextStyle(fontFamily: 'Cairo'),
      ),
    ));
  }

  static void showSuccess(
    context,
    msg, {
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? textColor,
    double? fontSize,
    EdgeInsetsGeometry? margin,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor ?? Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: margin ?? const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0.0),
      ),
      duration: const Duration(seconds: 3),
      content: Text(
        msg,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(fontFamily: 'Cairo', color: textColor ?? Colors.black, fontWeight: fontWeight, fontSize: fontSize ?? 14.0),
      ),
    ));
  }

  /// Show Snack Bar
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? color = Colors.black,
  }) {
    hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      backgroundColor: color,
    ));
  }

  static void hideSnackBar(BuildContext context) => ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
