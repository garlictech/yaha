import 'package:flutter/material.dart';

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
      controller: widget.controller,
      focusNode: _focusNode,
      onTap: _requestFocus,
      keyboardType: TextInputType.text,
      enableSuggestions: true,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: widget.title,
        contentPadding: const EdgeInsets.only(
            left: YahaSpaceSizes.medium, bottom: YahaSpaceSizes.small),
      ),
    );
  }
}
