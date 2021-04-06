import 'package:easymoney/models/kyc_model.dart';
import 'package:easymoney/services/kyc_service.dart';
import 'package:flutter/material.dart';

class KycStatus extends StatefulWidget {
  String kyc_msg;
  KycStatus({this.kyc_msg});

  @override
  _KycStatusState createState() => _KycStatusState();
}

//Center(child: Text(widget.kyc_msg))

class _KycStatusState extends State<KycStatus> {
  KycModel kycModel;
  KycService api = KycService();

  _getKycStatusChecked() async {
    return api.getkycStatus(userToken: widget.kyc_msg).then((value) {
      kycModel = value;
      //   print("Your kyc status msg " + kycModel.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          onPressed: () {
            _getKycStatusChecked();
          },
          color: Colors.blue[500],
          child: Text(
            "CHECK KYC STATUS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    ));
  }
}
