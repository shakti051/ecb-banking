import 'package:easymoney/models/kyc_model.dart';
import 'package:easymoney/services/post.dart';

class KycService {
  Post _post = Post();
  Future<KycModel> getkycStatus({String userToken}) async {
    final apiUrl = "https://lb.payizadlt.com/api/kyc/status";
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2Q4MzA2ODZhZmNmNTQyNWNlZDc5ZjYzZWM1MGJmYTNhMGY5MjAyMWIwNmQyMTAwNmMxM2FjNTM4YmE1YzIzYTgwZDg2MWUxM2QzNjA1ZmQiLCJpYXQiOjE2MTc0NTQyNDcsIm5iZiI6MTYxNzQ1NDI0NywiZXhwIjoxNjQ4OTkwMjQ3LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bL-ANcQ5aD3KEqhxSgk346QgBO4riDjnyYG7CBU6Ed-bpgC31aIhGy3ynFiNxGB0XY2ikTafd_EWZA6lK3lxSfOUtM2BxmNTf2r8JsQ5uWZJYNMQ0u2W4ipkQ0z9ch3b_AEdyYk6g8DqwZdcHH_7U6z6QkUkhxhE5nTkUbwh0VCQ0EGh1iERwSuA2wisU_0xn154R-vgEwJvtVxUE2H5L_E16gIEaOtCuyX6CYSj3AL1WRC5FidYknYnfFT1z9PZPz2TfKCCv1at-BPAm8ZoRqM98SC1dZSQB-Bi_v8Ef3pGFwNJtNVDHMh4LhK7wPfSuUEBKKOu4HsX-zYVIsog4DwgE_GER2vWlTm87r-0oBI9xc7iClzBTI5mERBacBdhPZQ7lstrhshwA-kJDh8-0K5Do93Ih3TBKi-xN3hySE4C42ZuN38pD-qqOXxbPgsIPAhMNwftfGMpDgicGaKE415xbAI8X8-M5nuxmIZab2KL54k5SXgXLy_vmUzvKrAn0HVgBpRXUCoqnvsmiuteOOEbUmw4K4tHeSP2VeJYIDKuQ9gD7CkYgQPGIJPcZr3YHO7OVsZowN7biOrDQLaC4yzCfUDF0pTcgaElCYIhjs9_Hw8bkPQpqlzpq3JJACPfleN1tgDSG63eMkx1sLBexC2EHJnp1QNvRvkxKNMG7yU";
    Map data = {"token": token};
    return _post.post(apiUrl, body: data).then((dynamic res) async {
      print("Response:  " + res.toString());
      return KycModel.fromJson(res);
    });
  }
}
