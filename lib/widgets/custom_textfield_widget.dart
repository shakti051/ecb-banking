import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key key,
    @required this.textEditingController,
    @required this.label,
    @required this.inputType,
    @required this.onFieldSubmitted,
    @required this.onValidate,
    @required this.isObscure,
    @required this.description,
    this.textInputAction=TextInputAction.next
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String label;
  final TextInputType inputType;
  final Function onFieldSubmitted;
  final Function onValidate;
  final bool isObscure;
  final String description;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        TextFormField(
          controller: textEditingController,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black),
          obscureText: isObscure,
          maxLines: 1,
          enabled: true,
          textInputAction: textInputAction,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // color: Color.fromRGBO(0, 0, 0, 1)),
                  color: Colors.black),
              alignLabelWithHint: true,
              fillColor: Color.fromRGBO(255, 255, 250, 1),
              // filled: true,
              errorStyle: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.red),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 10.0),
              ),
              hoverColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              )),
          onFieldSubmitted: onFieldSubmitted,
          validator: onValidate,
        ),
      ],
    );
  }
}
