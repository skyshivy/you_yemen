import 'dart:convert';

import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/models/password_validation_model.dart';
import 'package:you_yemen/files/sc_model/sc_confirm_otp_model.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/main.dart';

class StoreManager {
  static final StoreManager _instance = StoreManager._internal();

  StoreManager._internal() {
    print("initiali stro manager");
  }

  factory StoreManager() {
    return _instance;
  }
  AppSettingModel? appSetting;
  bool isEnglish = true;
  String language = "English";
  String languageSort = "en";
  String languageCode = "0";
  String msisdn = '0';
  bool isLoggedIn = false;
  String accessToken = '';
  String refreshToken = '';
  String userName = '';
  //String deviceId = '';
  String password = '';

  //final storage = FlutterSecureStorage();

  Future<void> initStoreManager() async {
    print("Store manager initialized");
    deviceId = prefs.getString("deviceId") ?? '';
    isEnglish = prefs.getBool("isEnglish") ?? true;
    isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    accessToken = prefs.getString("accessToken") ?? '';
    msisdn = prefs.getString("msisdn") ?? '0';
    refreshToken = prefs.getString("refreshToken") ?? '';
    userName = prefs.getString('userName') ?? '';
    password = prefs.getString('password') ?? 'Oem@L#@1';
    languageCode = isEnglish ? "0" : "1";
    language = isEnglish ? "English" : "Burmese";
    appCont.isLoggedIn.value = isLoggedIn;
    return;
  }

  checkStoredValue() {
    isEnglish = prefs.getBool("isEnglish") ?? true;
    isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    accessToken = prefs.getString("accessToken") ?? '';
    msisdn = prefs.getString("msisdn") ?? '0';
    refreshToken = prefs.getString("refreshToken") ?? '';
    userName = prefs.getString('userName') ?? '';
    deviceId = prefs.getString('deviceId') ?? '';
    password = prefs.getString('password') ?? 'Oem@L#@1';
    languageCode = isEnglish ? "0" : "1";
    language = isEnglish ? "English" : "Burmese";
  }

  Future<void> logout() async {
    setAccessToken('');
    setMsisdn('0');
    setRefreshToken('');
    setLoggedIn(false);
    setUserName('');
    setPassword('');
    setDeviceId('');
    print("Logout called from StoreManager");

    return;
  }

  setDeviceId(String value) async {
    deviceId = value;

    print("Storing deviceId = $deviceId");
    try {
      prefs.setString('deviceId', value);
    } catch (e) {
      print("Print Error only  = $e");
      print("Error saving deviceId = ${e.toString()}");
    }

    print("Setting msisdn = $value");
  }

  setTestBool(bool value) async {
    try {
      prefs.setBool('TestBool', value);
    } on Exception catch (e) {
      print("Error saving isLoogedin = ${e.toString()}");
    }

    print("Storing isLoggedin = $value");
  }

  setLanguageEnglish(bool english) async {
    isEnglish = english;
    language = isEnglish ? "English" : "Burmese";
    languageCode = isEnglish ? "0" : "1";
    try {
      prefs.setBool('isEnglish', english);
    } on Exception catch (e) {
      print("Error saving isEnglish = ${e.toString()}");
    }

    print("Storing isLoggedin = $english");
  }

  setMsisdn(String value) async {
    msisdn = value;
    print("Storing msisdn = $msisdn");
    try {
      prefs.setString('msisdn', value);
    } catch (e) {
      print("Print Error only  = $e");
      print("Error saving msisdn = ${e.toString()}");
    }

    print("Setting msisdn = $value");
  }

  setUserName(String value) async {
    userName = value;
    print("Storing userName = $value");
    try {
      prefs.setString('userName', value);
    } on Exception catch (e) {
      print("Error saving msuserName is = ${e.toString()}");
    }
  }

  setPassword(String value) async {
    if (value.isEmpty) {
      value = 'Oem@L#@1';
    }
    password = value;
    print("Storing password = $value");
    try {
      prefs.setString('password', value);
    } on Exception catch (e) {
      print("Error saving password = ${e.toString()}");
    }
  }

  setLoggedIn(bool value) async {
    isLoggedIn = value;
    appCont.isLoggedIn.value = value;
    try {
      prefs.setBool('isLoggedIn', value);
    } on Exception catch (e) {
      print("Error saving isLoogedin = ${e.toString()}");
    }

    print("Storing isLoggedin = $value");
  }

  setAccessToken(String value) async {
    accessToken = value;
    print("Storing accessToken = $value");
    try {
      prefs.setString('accessToken', value);
    } on Exception catch (e) {
      print("Error saving accessToken = ${e.toString()}");
    }
  }

  setRefreshToken(String value) async {
    refreshToken = value;
    print("Storing refresh token = $value");
    try {
      prefs.setString('refreshToken', value);
    } on Exception catch (e) {
      print("Error saving refreshToken = ${e.toString()}");
    }
  }

  Future<void> setLoginDetails(ScConfirmOtpModel detail) async {
//    convertedToString  ==========
    setLoggedIn(true);
    setAccessToken(detail.accessToken ?? '');

    setRefreshToken(detail.refreshToken ?? '');

    print("Login details is refreshToken ${detail.refreshToken}");
    print("Login details is accessToken ${detail.accessToken}");
    print("Login details is refreshToken ${detail.refreshToken}");
  }
}
