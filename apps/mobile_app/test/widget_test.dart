// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/event-detail-page.dart';
import 'package:mobile_app/hike-page.dart';

import 'package:mobile_app/main.dart';
import 'package:mobile_app/poi-page.dart';
import 'package:mobile_app/profile-page.dart';
import 'package:mobile_app/settings-page.dart';
import 'package:mobile_app/sign-up-page.dart';

void main() {
  testWidgets('Yaha main smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(true, true);
  });

  Widget createWidgetForTesting({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Hike Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new HikePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Poi Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new PoiPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Profile Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new ProfilePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Settings Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new SettingsPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new SignUpPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Event Detail Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new EventDetailPage()));

    await tester.pumpAndSettle();
  });
}
