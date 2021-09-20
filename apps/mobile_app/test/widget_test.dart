// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/auth/log-in-page.dart';
import 'package:yaha/auth/sign-up-page.dart';
import 'package:yaha/auth/sign-up-with-email-page.dart';
import 'package:yaha/bottom-nav-bar.dart';
import 'package:yaha/event-detail-page.dart';
import 'package:yaha/explore.dart';
import 'package:yaha/filter/filter-page.dart';
import 'package:yaha/gallery.dart';
import 'package:yaha/hike-outline/hike-outline-page.dart';
import 'package:yaha/hike-page.dart';
import 'package:yaha/home/home-page-guest.dart';

import 'package:yaha/main.dart';
import 'package:yaha/poi-page.dart';
import 'package:yaha/previous-activities-page.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/settings-page.dart';
import 'package:yaha/settings/application/application-page.dart';
import 'package:yaha/track-page.dart';

void main() {
  testWidgets('Yaha main smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    expect(true, true);
  });

  Widget createWidgetForTesting({Widget? child}) {
    return ProviderScope(
        child: MaterialApp(
      home: child,
    ));
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
  testWidgets('Application Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new ApplicationPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new SignUpPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up With Email Page smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new SignUpWithEmailPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Log In Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new LogInPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Event Detail Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new EventDetailPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Track Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new TrackPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Gallery smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Gallery()));

    await tester.pumpAndSettle();
  });
  testWidgets('Bottom nav bar smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new BottomNavBar()));

    await tester.pumpAndSettle();
  });
  testWidgets('Guest Home Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new HomePageGuest()));

    await tester.pumpAndSettle();
  });
  testWidgets('Filter Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new FilterPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Explore Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new ExplorePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Previous Activities Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new PreviousActivitiesPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Hike Outline Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new HikeOutlinePage()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Hike Outline Settings smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new HikeOutlineSettings()));

    await tester.pumpAndSettle();
  });*/
}
