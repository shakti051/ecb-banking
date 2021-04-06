import 'dart:async';
import 'dart:convert';
import 'package:easymoney/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

postreq(String url, headers, body, context) async {
  try {
    var pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
    await pr.show();
    final response = await http.post(
      BASE_URL + url,
      headers: headers,
      body: body,
    );
    var res = jsonDecode(response.body);
    await pr.hide();
    if (response.statusCode == 400 || response.statusCode == 500) {
      return {'responce': res['message'], 'statusCode': 201};
    }
    return {'responce': res, 'statusCode': 200};
  } catch (error) {
    print(error);
  }
}

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(BASE_URL + url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, headers, body) async {
    try {
      http
          .post(BASE_URL + url, body: body, headers: headers)
          .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400) {
          throw new Exception("Error while fetching data");
        }
        return _decoder.convert(res);
      });
    } catch (error) {
      print(error);
    }
  }
}
