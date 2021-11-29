import 'dart:convert';

import 'package:flutter/material.dart';

import 'app_colors.dart';

const String _username = 'dev3';
const String _password = 'aNother123';
var basicAuth = 'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';

Map<String, String> userHeader = {'authorization': basicAuth};
Map<String, String> jsonHeader = {
  "Content-Type": "application/json",
  "Accept": "*/*",
  'authorization': basicAuth
};

const String helpNumber = '+91 8281626281';

abstract class RoutePaths {
  static const String Splash = '/';
  static const String City = '/city';
  static const String Login = '/login';
  static const String OTP = '/otp';
  static const String Register = '/register';
  static const String Dashboard = '/dashboard';
  static const String Booking = '/booking';
  static const String Notification = '/notification';
  static const String BookingDetails = '/bookingDetails';
  static const String Address = '/address';
  static const String LocationPicker = '/locationPicker';
  static const String Checkout = '/checkout';
  static const String Profile = '/profile';
  static const String Promocode = '/promocode';
  static const String About = '/about';
  static const String Terms = '/tearms';
  static const String PrivacyPolicy = '/privacyPolicy';
  static const String Offline = '/offline';
  static const String SubServiceView = '/subservice';
  static const String BookingView = '/booking';
}

abstract class Prefs {
  static const String isLoggedIn = 'isLoggedIn';
  static const String user = 'user';
}

abstract class FontFamily {
  static const String Barlow = 'Barlow';
  static const String Ubuntu = 'Ubuntu';
}

abstract class ServiceType {
  static const int NormalService = 0;
  static const int UrgentService = 1;
}

abstract class PaymentMethod {
  static const int CashOnDelivery = 0;
  static const int Online = 1;
}

abstract class BookingStatus {
  static const String Processing = 'Processing';
  static const String Cancelled = 'Cancelled';
  static const String Completed = 'Completed';

  static Color colorOf(String status) {
    switch (status) {
      case Processing:
        return Palette.orange;
      case Cancelled:
        return Color(0xffFF1F1F);
      case Completed:
        return Color(0xff080808);
      default:
        return Color(0xff080808);
    }
  }

  static String prefixOf(String status) {
    if (status == Processing) {
      return 'Scheduled on';
    }
    return 'Booked on';
  }
}
