import 'dart:convert';

import 'package:dsproject/core/helper/cashe_helper.dart';
import 'package:flutter/material.dart';

class HiveHelper {
  static void setToken(var savedHeader) {
    CacheHelper.saveData(key: 'token', value: savedHeader);
  }

  static void clearData() {
    CacheHelper.clearData();
  }

  static String? getToken() {
    return CacheHelper.getData(key: 'token');
  }
}
