import 'package:flutter/material.dart';

import 'yaha-border-radius.dart';
import 'yaha-border-width.dart';
import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';
import 'yaha-space-sizes.dart';

class YahaTextFieldPassword extends StatefulWidget {
  final String title;
  final Function? onChanged;

  const YahaTextFieldPassword({
    Key? key,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  _YahaTextFieldPasswordState createState() =>
      _YahaTextFieldPasswordState(onChanged: onChanged);
}

class _YahaTextFieldPasswordState extends State<YahaTextFieldPassword> {
  bool _passwordVisible = false;
  final Function? onChanged;

  _YahaTextFieldPasswordState({
    required this.onChanged,
  });

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
          if (value!.contains(RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter a password';
          } else {
            return 'Not valid password';
          }
        },
        focusNode: _focusNode,
        onTap: _requestFocus,
        onChanged: (value) => onChanged?.call(value),
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        enableSuggestions: false,
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
