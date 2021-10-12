// import 'package:flutter/material.dart';
// import 'package:yaha/utility/yaha-border-radius.dart';
// import 'package:yaha/utility/yaha-border-width.dart';
// import 'package:yaha/utility/yaha-colors.dart';
// import 'package:yaha/utility/yaha-font-sizes.dart';
// import 'package:yaha/utility/yaha-space-sizes.dart';

// class YahaTextField extends StatefulWidget {
//   final String title;

//   const YahaTextField({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//    @override
//   _YahaTextFieldState createState() => _YahaTextFieldState();
// }
// class _YahaTextFieldState extends State<YahaTextFieldState> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         enableSuggestions: false,
//         autocorrect: false,
//         style: TextStyle(
//             fontWeight: FontWeight.w500,
//             color: YahaColors.textColor,
//             fontSize: YahaFontSizes.small),
//         decoration: InputDecoration(
//             focusColor: YahaColors.military,
//             labelText: this.title,
//             contentPadding: EdgeInsets.only(left: YahaSpaceSizes.medium),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(YahaBorderRadius.small),
//                 borderSide: BorderSide(
//                     color: YahaColors.textColor, width: YahaBorderWidth.small)),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(YahaBorderRadius.small),
//                 borderSide: BorderSide(
//                     color: YahaColors.primary, width: YahaBorderWidth.small))),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

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
          if(value!.isNotEmpty && value.length > 2) {
            return null;
          } else {
            return 'Not good';
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
                    color: YahaColors.primary, width: YahaBorderWidth.xSmall))),
      ),
    );
  }
}
