import 'dart:async';

import 'package:adarsh/constants/app_constants.dart';
import 'package:adarsh/models/appuser.dart';
import 'package:adarsh/services/navigation_service.dart';
import 'package:adarsh/widgets/tools/base_view_models.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '/services/api_service.dart';


class SplashViewModel extends BaseViewModel {
  SplashViewModel({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;
  Timer? _timer;

  void startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var hasUser = false;
    hasUser = prefs.containsKey(Prefs.isLoggedIn);
    if (hasUser) hasUser = prefs.getBool(Prefs.isLoggedIn) ?? false;

    await _apiService.loadCredential();
    AppUser? user = _apiService.user;
    if (user?.id == null) hasUser = false;

    _timer = Timer(Duration(seconds: 1), () {
      if (hasUser) {
        navigationService.pushReplacementNamed(RoutePaths.Dashboard);
      } else {
        navigationService.pushReplacementNamed(RoutePaths.Login);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
