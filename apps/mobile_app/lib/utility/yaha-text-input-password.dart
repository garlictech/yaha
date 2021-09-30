import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class YahaTextFieldPassword extends StatefulWidget {
  final String title;

  const YahaTextFieldPassword({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _YahaTextFieldPasswordState createState() => _YahaTextFieldPasswordState();
}

class _YahaTextFieldPasswordState extends State<YahaTextFieldPassword> {
  bool _passwordVisible = false;

  FocusNode _focusNode = new FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        focusNode: _focusNode,
        onTap: _requestFocus,
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: YahaColors.textColor,
            fontSize: YahaFontSizes.small),
        cursorColor:
            _focusNode.hasFocus ? YahaColors.primary : YahaColors.textColor,
        decoration: InputDecoration(
            focusColor: YahaColors.military,
            labelText: widget.title,
            labelStyle: TextStyle(
                color: _focusNode.hasFocus
                    ? YahaColors.primary
                    : YahaColors.textColor),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: YahaColors.textColor,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            contentPadding: EdgeInsets.only(left: YahaSpaceSizes.medium),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(YahaBorderRadius.general),
                borderSide: BorderSide(
                    color: YahaColors.textColor, width: YahaBorderWidth.xSmall)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(YahaBorderRadius.general),
                borderSide: BorderSide(
                    color: YahaColors.primary, width: YahaBorderWidth.xSmall))),
      ),
    );
  }
}
