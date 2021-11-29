import '/constants/app_colors.dart';
import '/services/navigation_service.dart';
import 'package:flutter/material.dart';

Widget? backButton() {
  if (!navigationService.canPop()) {
    return null;
  }
  return IconButton(
    onPressed: () => navigationService.goBack(),
    icon: Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Image.asset(
        "assets/images/back.png",
        width: 15,
      ),
    ),
    splashRadius: 28,
    color: Colors.white,
    tooltip: 'Back',
  );
}

Widget overlayProgressIndicator(BuildContext context) {
  return Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).scaffoldBackgroundColor,
    ),
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Palette.primary),
      ),
    ),
  );
}
