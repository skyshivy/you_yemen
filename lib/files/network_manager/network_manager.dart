import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:get/get.dart';
import 'package:universal_io/io.dart';
import 'package:you_yemen/files/common/custom_header.dart';
import 'package:you_yemen/files/models/regenerate_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

class NetworkManager {
  final client = HttpClient();

  Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? params}) async {
    try {
      var request = await client.getUrl(Uri.parse(url));

      request = await CustomHeader().settingHeader(url, request);
      if (params != null) {
        for (var entry in params.entries) {
          print(entry.key);
          print(entry.value);
          request.headers.set(entry.key, entry.value, preserveHeaderCase: true);
        }
      }
      String stringData = '';
      HttpClientResponse response1 = await request.close();

      stringData = await response1.transform(utf8.decoder).join();
      print(stringData);

      print("resp code is ${response1.statusCode} \nfor url $url");
      if (response1.statusCode == 498) {
        await _regenarateTokenFromOtherClass();
        var request = await client.getUrl(Uri.parse(url));

        request = await CustomHeader().settingHeader(url, request);
        String stringData = '';
        HttpClientResponse response1 = await request.close();

        stringData = await response1.transform(utf8.decoder).join();
        Map<String, dynamic> valueMap = json.decode(stringData);
        return valueMap;
      } else {
        Map<String, dynamic> valueMap = json.decode(stringData);
        return valueMap;
      }
      // else {
      //   return null;
      // }
    } catch (error) {
      print("error for url ${url}");
      print("error =   =  ${error}");
      Map<String, dynamic> valueMap =
          json.decode("""{"message":"Socket Error: ${error.toString()}"}""");
      return valueMap;
    }
  }

  Future<Map<String, dynamic>> post(String url, String? formData,
      {String? msisdn, Map<String, dynamic>? jsonData}) async {
    try {
      HttpClientRequest request = await client.postUrl(Uri.parse(url));

      request = await CustomHeader().settingHeader(url, request);
      if (msisdn != null) {
        request.headers.set('msisdn', msisdn, preserveHeaderCase: true);
      }
      if (jsonData != null) {
        //application/json

        request.headers
            .set('Content-Type', 'application/json', preserveHeaderCase: true);
        print("before encode $jsonData");
        String jsonstringmap = json.encode(jsonData);
        print(jsonstringmap);
        print("print formed data $jsonstringmap");
        request.write(jsonstringmap);
      }
      if (formData != null) {
        request.write(formData);
      }
      HttpClientResponse response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();
      if (kDebugMode) {
        print(stringData);
      }
      if (response.statusCode == 498) {
        await _regenarateTokenFromOtherClass();
        HttpClientRequest request4 = await client.postUrl(Uri.parse(url));
        request4 = await CustomHeader().settingHeader(url, request4);
        if (msisdn != null) {
          request4.headers.set('msisdn', msisdn, preserveHeaderCase: true);
        }

        if (formData != null) {
          request4.write(formData);
        }
        HttpClientResponse response4 = await request4.close();
        final stringData4 = await response4.transform(utf8.decoder).join();
        Map<String, dynamic> valueMap4 = json.decode(stringData4);
        print("Request url = $url");
        return valueMap4;
      }

      print("resp code is ${response.statusCode}");
      Map<String, dynamic> valueMap = json.decode(stringData);
      return valueMap;
    } on SocketException catch (e) {
      Map<String, dynamic> valueMap =
          json.decode("""{"message":"Socket Error: ${e.toString()}"}""");
      return valueMap;
    } on TimeoutException catch (e) {
      Map<String, dynamic> valueMap =
          json.decode("""{"message":"Timeout Error: ${e.toString()}"}""");
      return valueMap;
    } on Error catch (e) {
      print("error is ${e.toString()}");
      Map<String, dynamic> valueMap =
          json.decode("""{"message":"${e.toString()}"}""");
      return valueMap;
    }
  }

  Future<void> _regenarateTokenFromOtherClass() async {
    Map<String, dynamic> res = await _reGeneratToken();
    RegenTokenModel model = RegenTokenModel.fromJson(res);
    if (model.statusCode == 'SC0000') {
      StoreManager().setAccessToken(model.responseMap?.accessToken ?? '');
      StoreManager().setRefreshToken(model.responseMap?.refreshToken ?? '');
      StoreManager().accessToken = model.responseMap?.accessToken ?? '';
      StoreManager().refreshToken = model.responseMap?.refreshToken ?? "";
      await Future.delayed(const Duration(milliseconds: 300));
    } else {
      StoreManager().logout();
      print("Logout called from sercice call if reGeneratToken fails");
    }
    print("======Regene token ====== ${model.statusCode}");
    return;
  }

  _reGeneratToken() async {
    String refreshToken = StoreManager().refreshToken;
    //String accessToken = StoreManager().accessToken;

    String url = regenTokenUrl;
    print("3url used currently is $url");

    var parts = [];
    var body = {'refreshToken': refreshToken};
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    print("\nformed data is \n$formData\n");
    print("line 41");

    var request = await client.postUrl(Uri.parse(url));

    print("line 45");

    request = await CustomHeader().settingHeader(url, request);
    request.write(formData);
    HttpClientResponse response = await request.close();

    if (response.statusCode == 498 || response.statusCode == 500) {
      print("Logut in case of regen");
    }
    final stringData = await response.transform(utf8.decoder).join();
    Map<String, dynamic> valueMap = json.decode(stringData);
    return valueMap;
  }

  postrequest(String url, formData) {}
}
