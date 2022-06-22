import 'package:flutter/material.dart';

import 'yaha-border-radius.dart';
import 'yaha-border-width.dart';
import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';
import 'yaha-space-sizes.dart';

class YahaTextField extends StatefulWidget {
  final String title;
  final IconData? icon;
  final controller;

  const YahaTextField({
    Key? key,
    required this.title,
    this.icon,
    this.controller,
  }) : super(key: key);

  @override
  _YahaTextFieldState createState() => _YahaTextFieldState();
}

class _YahaTextFieldState extends State<YahaTextField> {
  FocusNode _focusNode = FocusNode();
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
    return SizedBox(
      height: 40.0,
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
        style: const TextStyle(
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
          contentPadding: const EdgeInsets.only(left: YahaSpaceSizes.medium),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: const BorderSide(
                  color: YahaColors.textColor, width: YahaBorderWidth.xSmall)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: const BorderSide(
                  color: YahaColors.primary, width: YahaBorderWidth.xSmall)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: const BorderSide(
                  color: YahaColors.error, width: YahaBorderWidth.xSmall)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: const BorderSide(
                  color: YahaColors.error, width: YahaBorderWidth.xSmall)),
          errorStyle: const TextStyle(
              fontSize: YahaFontSizes.xSmall, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
