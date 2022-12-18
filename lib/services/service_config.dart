import 'package:colyseus_monitor_plus/configs/app_config.dart';
import 'package:colyseus_monitor_plus/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final client = Dio(BaseOptions(baseUrl: AppUrl));
Future<void> initalizeService() async {
  client.interceptors
      .add(InterceptorsWrapper(onRequest: ((options, handler) async {
    final token = "";
    options.headers.addAll({"authorization": "Bearer ${token}"});
    handler.next(options);
    print("Requesting ${options.uri}");
  }), onResponse: ((e, handler) {
    final res = ResponseEntity.fromJson(e.data, (data) => null);
    print("Response ${e.realUri} message:${res.message} errors:${res.errors}");

    handler.next(e);
  }), onError: ((e, handler) {
    print(e);
    if (e.response != null) {
      final res = ResponseEntity.fromJson(e.response!.data, (data) => null);
      print(res.errors);
      print(res.message);

      // getx.Get.snackbar("Request failed", res.errors ?? "error");

    } else {
      // getx.Get.snackbar("Request failed", e.message);
    }
  })));
}

class ResponseEntity<T> {
  String message = "";
  List<String>? errors;
  T? data;
  ResponseEntity.fromJson(
      Map<String, dynamic> json, T Function(dynamic data) onParseData) {
    message = json['message'];
    errors = json['errors'];
    data = onParseData(json["data"]);
  }
  Map<String, dynamic> toJson(dynamic Function(T data) onToJson) {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['data'] = onToJson(this.data!);
    json['errors'] = errors;
    json['message'] = message;

    return json;
  }
}
