import 'package:flutter/material.dart';

import '../../enum/snackbar_type/snackbar_type.dart';
import '../../utils/theme/theme.dart';

void showCustomSnackBar(
  BuildContext context, {
  required SnackBarType snackBarType,
  required String message,
  Duration duration = const Duration(seconds: 3),
}) {
  Color backgroundColor;
  IconData iconData;

  switch (snackBarType) {
    case SnackBarType.success:
      backgroundColor = Colors.green.shade600;
      iconData = Icons.check_circle;
      break;
    case SnackBarType.error:
      backgroundColor = Colors.red.shade600;
      iconData = Icons.error;
      break;
    case SnackBarType.warning:
      backgroundColor = Colors.orange.shade700;
      iconData = Icons.warning_amber_rounded;
      break;
    case SnackBarType.info:
      backgroundColor = Colors.blue.shade600;
      iconData = Icons.info;
      break;
  }

  final String showMessage;

  // if (message.containsHtml) {
  //   showMessage = "Server error. Please try again later.";
  // } else {
  //   showMessage = message;
  // }
  showMessage = message;

  final snackBar = SnackBar(
    duration: duration,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          // App Logo
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(6),
          //   ),
          //   child: Image.asset(PngAssets.brandLogoTrans, width: 20, height: 20),
          // ),

          // Message Text
          Expanded(
            child: Text(
              showMessage,
              // style: context.text.labelLarge!.copyWith(color: white),
              style: TextStyle(color: white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // SnackbarType Icon
          Icon(iconData, color: Colors.white, size: 24),
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
