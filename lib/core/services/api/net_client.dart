import 'dart:async';
import 'dart:io';

import 'package:company_task/consts.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetClient {
  static const int receiveTimeout = 2000;

  Future<Response> sendGet(String url, {params}) async {
    Logger().d(host + url);
    if (params != null) Logger().d("params =>" + params.toString());
    Client client = Client();
    Map headers = <String, String>{
      'Content-Type': 'application/json',
    };
    Uri uri = Uri.parse(host + url);
    if (params != null) uri = uri.replace(queryParameters: params);
    try {
      final Response response = await client.get(
        uri,
        headers: headers,
      );
      Logger().d("code =>" + response.statusCode.toString());
      Logger().d("body =>" + response.body);
      return response;
    } on SocketException {
      Logger().d("WAIT");
      return await Future.delayed(const Duration(milliseconds: receiveTimeout),
          () async {
        Logger().d("RESENT");
        return await sendGet(url, params: params);
      });
    }
  }
}
