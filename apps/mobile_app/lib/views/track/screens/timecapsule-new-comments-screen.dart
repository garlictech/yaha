//import 'package:flutter/material.dart';
//import 'package:hooks_riverpod/hooks_riverpod.dart';

/*class TimeCapsuleNewCommentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold();
  }
}*/

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class TimeCapsuleNewCommentsScreen extends StatefulWidget {
  const TimeCapsuleNewCommentsScreen({Key? key}) : super(key: key);

  @override
  _TimeCapsuleNewCommentsScreenState createState() =>
      _TimeCapsuleNewCommentsScreenState();
}

class _TimeCapsuleNewCommentsScreenState
    extends State<TimeCapsuleNewCommentsScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: const DefaultChatTheme(
            inputBackgroundColor: YahaColors.grey200,
            inputTextColor: YahaColors.textColor,
            inputTextCursorColor: YahaColors.textColor,
            primaryColor: YahaColors.timeCapsule,
            secondaryColor: YahaColors.grey200,
            sentMessageBodyTextStyle: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.xSmall,
                fontWeight: FontWeight.w500),
            backgroundColor: YahaColors.timeCapsuleBackground,
            inputBorderRadius: BorderRadius.all(Radius.circular(20)),
            inputPadding: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
