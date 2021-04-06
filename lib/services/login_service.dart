import 'dart:convert';
import 'package:easymoney/models/login_model.dart';
import 'package:easymoney/services/post.dart';

class LoginService {
  Post _post = Post();
  Future<LoginModel> getLogin({String userName, String userPassword}) async {
    final apiUrl = "https://lb.payizadlt.com/api/login";
    Map data = {
      "email": userName,
      "password": userPassword,
    };
    return _post.post(apiUrl, body: data).then((dynamic res) async {
     // print("Response:  " + res.toString());
      return LoginModel.fromJson(res);
    });
  }
}
