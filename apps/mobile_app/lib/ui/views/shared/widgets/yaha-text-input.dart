import 'package:flutter/material.dart';

import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';
import 'yaha-space-sizes.dart';

class YahaTextField extends StatefulWidget {
  final String title;
  final IconData? icon;
  final TextEditingController? controller;

  const YahaTextField({
    Key? key,
    required this.title,
    this.icon,
    this.controller,
  }) : super(key: key);

  @override
  YahaTextFieldState createState() => YahaTextFieldState();
}

class YahaTextFieldState extends State<YahaTextField> {
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
    return TextFormField(
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
      enableSuggestions: true,
      autocorrect: false,
      style: const TextStyle(
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
        contentPadding: const EdgeInsets.only(
            left: YahaSpaceSizes.medium, bottom: YahaSpaceSizes.small),
        errorStyle: const TextStyle(
            fontSize: YahaFontSizes.xSmall, fontWeight: FontWeight.w500),
      ),
    );
  }
}
