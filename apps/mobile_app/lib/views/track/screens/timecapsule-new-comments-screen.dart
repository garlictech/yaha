//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

/*class TimeCapsuleNewCommentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
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
import 'package:image_picker/image_picker.dart';

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

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
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
          onAttachmentPressed: _handleImageSelection,
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
            //attachmentButtonIcon: Icon(Icons.add_outlined),
          ),
        ),
      ),
    );
  }
}
