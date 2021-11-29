import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

String getDeviceType() {
  String deviceType = '';
  if (Platform.isAndroid) {
    deviceType = '1';
  } else if (Platform.isIOS) {
    deviceType = '2';
  }
  return deviceType;
}

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

bool Function(List<dynamic>, List<dynamic>) compareList =
    const ListEquality().equals;

String secToTime(int sec) {
  String time = Duration(seconds: sec).toString();
  return time.substring(time.indexOf(':') + 1, time.lastIndexOf('.'));
}

int wordCount(String text) => text.split(' ').length;

String formattedServiceName(String text) {
  if (wordCount(text) == 2) {
    return text.replaceAll(' ', '\n');
  } else {
    return text;
  }
}
