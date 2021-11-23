import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class YahaTextFieldEmail extends StatefulWidget {
  final String title;
  final IconData? icon;
  final controller;

  const YahaTextFieldEmail({
    Key? key,
    required this.title,
    this.icon,
    this.controller,
  }) : super(key: key);

  @override
  _YahaTextFieldEmailState createState() => _YahaTextFieldEmailState();
}

class _YahaTextFieldEmailState extends State<YahaTextFieldEmail> {
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
        validator: (value) {
          if (value!.isNotEmpty &&
              value.contains(RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter your email address';
          } else {
            return 'Please enter a valid email address';
          }
        },
        controller: widget.controller,
        focusNode: _focusNode,
        onTap: _requestFocus,
        keyboardType: TextInputType.text,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: YahaColors.textColor,
            fontSize: YahaFontSizes.small),
        cursorColor:
            _focusNode.hasFocus ? YahaColors.primary : YahaColors.textColor,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              widget.icon,
              color: YahaColors.primary,
              size: 28.0,
            ),
            onPressed: () {},
          ),
          focusColor: YahaColors.military,
          labelText: widget.title,
          labelStyle: TextStyle(
              color: _focusNode.hasFocus
                  ? YahaColors.primary
                  : YahaColors.textColor),
          contentPadding: EdgeInsets.only(left: YahaSpaceSizes.medium),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(
                  color: YahaColors.textColor, width: YahaBorderWidth.xSmall)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(
                  color: YahaColors.primary, width: YahaBorderWidth.xSmall)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(
                  color: YahaColors.error, width: YahaBorderWidth.xSmall)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(
                  color: YahaColors.error, width: YahaBorderWidth.xSmall)),
          errorStyle: TextStyle(
              fontSize: YahaFontSizes.xSmall, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
