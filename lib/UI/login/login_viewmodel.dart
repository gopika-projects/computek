import 'package:adarsh/constants/app_constants.dart';
import 'package:adarsh/services/api_service.dart';
import 'package:adarsh/services/navigation_service.dart';
import 'package:adarsh/services/notification_service.dart';
import 'package:adarsh/widgets/tools/base_view_models.dart';

import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required ApiService apiService,
    required NotificationService notificationService,
  })  : _apiService = apiService,
        _notificationService = notificationService;

  final ApiService _apiService;
  final NotificationService _notificationService;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? mobile;
  String countryCode = '+91';
  Future<void> login() async {
    if (isBusy) return;
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();

      bool status = await runBusyFuture(
        _apiService.handleLogin(
          countryCode: countryCode,
          mobile: mobile!,
       //   deviceType: getDeviceType(),
          deviceToken: await _notificationService.getDeviceToken(),
        ),
      );
      if (status) {
        navigationService.pushNamed(RoutePaths.OTP);
      }
    } else {
      setAutovalidateMode(AutovalidateMode.always);
    }
  }

  void setAutovalidateMode(AutovalidateMode mode) {
    autovalidateMode = mode;
    notifyListeners();
  }

  void setCountryCode(String code) {
    countryCode = code;
  }
}
