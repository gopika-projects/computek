import 'dart:convert';

import 'package:adarsh/constants/app_constants.dart';
import 'package:adarsh/models/appuser.dart';
import 'package:adarsh/widgets/toast.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://dev3";
  static const String baseUrlApi = "$baseUrl/api/user";
  static const String baseUrlImage = "$baseUrl/storage/app";

  // bool isLoggedIn = true;
  AppUser? user;
  var client = http.Client();
  Duration timeoutDuration = Duration(seconds: 20);

  static const Map<String, String> jsonHeader = {
    'Accept': 'application/json',
  };

  Future<void> saveLoginCredential(AppUser appUser) async {
    this.user = appUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Prefs.isLoggedIn, true);
    prefs.setString(Prefs.user, jsonEncode(this.user!.toJson()));
  }

  Future<void> loadCredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(Prefs.user);
    if (value != null) {
      this.user = AppUser.fromJson(jsonDecode(value));
    } else {
      this.user = null;
    }
  }

  // void setIsLoggedIn(bool value) {
  //   this.isLoggedIn = value;
  // }

  Future<bool> handleLogin(
      {required String countryCode,
      required String mobile,
      deviceType,
      required String deviceToken}) async {
    bool status = false;
    var response = await client
        .post(
          Uri.parse("$baseUrlApi/userlogin"),
          headers: jsonHeader,
          body: {
            'country_code': '$countryCode',
            'mobile': '$mobile',
            'device_type': '$deviceType',
            'device_token': '$deviceToken',
          },
        )
        .timeout(timeoutDuration, onTimeout: () => http.Response("", 408))
        .catchError((onError) => http.Response("$onError", 404));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      if (jsonBody["ErrorCode"] == 0) {
        if (jsonBody['Data'] != null) {
          this.user = new AppUser.fromLoginResponse(jsonBody['Data']);
          status = true;
          showToast('${this.user?.otp ?? '----'}');
        } else {
          this.user = null;
        }
      } else {
        print('login Response: Error -> ${jsonBody["Message"]}');
      }
    } else {
      print('login Response: Server Error -> ${response.body}');
    }
    return status;
  }

  Future<bool> verifyOtp({
    required String otp,
  }) async {
    bool status = false;
    var response = await client
        .post(
          Uri.parse("$baseUrlApi/verifyOtp"),
          headers: jsonHeader,
          body: {
            'user_id': '${this.user?.id}',
            'otp': '$otp',
          },
        )
        .timeout(timeoutDuration, onTimeout: () => http.Response("", 408))
        .catchError((onError) => http.Response("$onError", 404));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      if (jsonBody["ErrorCode"] == 0) {
        if (jsonBody['Data'] != null) {
          this.user = new AppUser.fromOtpResponse(jsonBody['Data'], this.user!);
          status = true;
        } else {
          this.user = null;
        }
      } else {
        showToast('${jsonBody["Message"]}');
        print('verifyOtp Response: Error -> ${jsonBody["Message"]}');
      }
    } else {
      print('verifyOtp Response: Server Error -> ${response.body}');
    }
    return status;
  }

  Future<bool> resendOtp() async {
    bool status = false;
    var response = await client
        .post(
          Uri.parse("$baseUrlApi/resendOtp"),
          headers: jsonHeader,
          body: {
            'user_id': '${this.user?.id}',
          },
        )
        .timeout(timeoutDuration, onTimeout: () => http.Response("", 408))
        .catchError((onError) => http.Response("$onError", 404));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      if (jsonBody["ErrorCode"] == 0) {
        if (jsonBody['Data'] != null) {
          this.user = new AppUser.fromResendResponse(
            jsonBody['Data'],
            this.user!,
          );
          status = true;
          showToast('${this.user?.otp ?? '----'}');
        }
      } else {
        print('resendOtp Response: Error -> ${jsonBody["Message"]}');
      }
    } else {
      print('resendOtp Response: Server Error -> ${response.body}');
    }
    return status;
  }

  
}

void setIsLoggedIn(bool bool) {}
