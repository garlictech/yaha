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
import 'package:yaha/auth/views/screens/login-screen.dart';
import 'package:yaha/auth/views/screens/signup-screen.dart';
import 'package:yaha/bottom-nav-bar.dart';
import 'package:yaha/profile/bookmarked-hikes.dart';
import 'package:yaha/profile/events/all-events.dart';
import 'package:yaha/profile/events/event-detail-page.dart';
import 'package:yaha/explore.dart';
import 'package:yaha/filter/filter-page.dart';
import 'package:yaha/gallery.dart';
import 'package:yaha/hike-page.dart';
import 'package:yaha/hike/hike-outline/hike-outline-page.dart';
import 'package:yaha/home/home-page-guest.dart';

import 'package:yaha/main.dart';
import 'package:yaha/poi-page.dart';
import 'package:yaha/previous-activities-page.dart';
import 'package:yaha/profile/challenges/all-challenges.dart';
import 'package:yaha/profile/challenges/challenges.dart';
import 'package:yaha/profile/challenges/my-challenges.dart';
import 'package:yaha/profile/events/events.dart';
import 'package:yaha/profile/events/ongoing-events.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/profile/statistics/statistics-page.dart';
import 'package:yaha/profile/time-capsules/time-capsules.dart';
import 'package:yaha/settings/application/application-page.dart';
import 'package:yaha/settings/views/settings-screen.dart';
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
    await tester
        .pumpWidget(createWidgetForTesting(child: new SettingsScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Application Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new ApplicationPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new SignupScreen()));
    await tester.pumpAndSettle();
  });
  /*testWidgets('Sign Up With Email Page smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester
        .pumpWidget(createWidgetForTesting(child: new SignupWithEmailScreen()));

    await tester.pumpAndSettle();
  });
*/

  testWidgets('Log In Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester.pumpWidget(createWidgetForTesting(child: new LogInScreen()));

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
  testWidgets('Previous Activities Page smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: new PreviousActivitiesPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Hike Outline Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new HikeOutlinePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Login Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new LogInScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Login With Email Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester
        .pumpWidget(createWidgetForTesting(child: new LogInWithEmailScreen()));

    await tester.pumpAndSettle();
  });*/
  testWidgets('Sign Up Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester.pumpWidget(createWidgetForTesting(child: new SignupScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Sign Up With Email Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    await tester
        .pumpWidget(createWidgetForTesting(child: new SignupWithEmailScreen()));

    await tester.pumpAndSettle();
  });
  */
  testWidgets('Challenges Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Challenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('All Challenges Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new AllChallenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('My Challenges Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new MyChallenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('Events Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new Events()));

    await tester.pumpAndSettle();
  });
  testWidgets('All Events Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new AllEvents()));

    await tester.pumpAndSettle();
  });
  testWidgets('Ongoing Events Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new OngoingEvents()));

    await tester.pumpAndSettle();
  });
  testWidgets('Statistics Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new StatisticsPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('TimeCapsules Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new TimeCapsules()));

    await tester.pumpAndSettle();
  });
  testWidgets('Bookmarked Hikes Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: new BookmarkedHikes()));

    await tester.pumpAndSettle();
  });
}
