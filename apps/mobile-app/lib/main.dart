import 'package:flutter/material.dart';
import 'package:mobile_app/poi-page.dart';
import 'package:mobile_app/profile-page.dart';
import 'package:mobile_app/settings-page.dart';
import 'hike-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF29A253),
          scaffoldBackgroundColor: Color(0xFFFDFBF7),
          fontFamily: 'Inter'),
      home: HikePage(),
    );
  }
}
