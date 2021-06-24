// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/hike-page.dart';

import 'package:mobile_app/main.dart';
import 'package:mobile_app/poi-page.dart';
import 'package:mobile_app/profile-page.dart';
import 'package:mobile_app/settings-page.dart';
import 'package:mobile_app/sign-up-page.dart';

void main() {
  testWidgets('Yaha smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(true, true);
  });
 
  //   testWidgets('Yaha hike page test', (WidgetTester tester) async {
  //   await tester.pumpWidget(HikePage());
  //   expect(true, true);
  // });
  // testWidgets('Yaha poi page test', (WidgetTester tester) async {
  //   await tester.pumpWidget(PoiPage());
  //   expect(true, true);
  // });
  // testWidgets('Yaha profile page test', (WidgetTester tester) async {
  //   await tester.pumpWidget(ProfilePage());
  //   expect(true, true);
  // });
  // testWidgets('Yaha settings page test', (WidgetTester tester) async {
  //   await tester.pumpWidget(SettingsPage());
  //   expect(true, true);
  // });
  // testWidgets('Yaha sign up page test', (WidgetTester tester) async {
  //   await tester.pumpWidget(SignUpPage());
  //   expect(true, true);
  // });
  
}
