// This is a basic Flutter widget test.  To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unnecessary_const

import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/bottom-nav-bar.dart';
import 'package:yaha/hike/hike-screen/most-interesting-place-on-route/places-on-route-screen.dart';
import 'package:yaha/hike/views/screens/more-poi-screen.dart';
import 'package:yaha/hike/views/screens/weather-screen.dart';
import 'package:yaha/profile/bookmarked-hikes.dart';
import 'package:yaha/profile/challenges/views/screens/all-challenges.dart';
import 'package:yaha/profile/challenges/views/screens/challenge-detail-screen.dart';
import 'package:yaha/profile/challenges/views/screens/challenges.dart';
import 'package:yaha/profile/challenges/views/screens/my-challenges.dart';
import 'package:yaha/profile/events/views/screens/all-events.dart';
import 'package:yaha/profile/events/views/screens/event-detail-screen.dart';
import 'package:yaha/explore.dart';
import 'package:yaha/filter/filter-page.dart';
import 'package:yaha/gallery.dart';
import 'package:yaha/hike/hike-screen/hike-screen.dart';
import 'package:yaha/hike/hike-outline/hike-outline-screen.dart';
import 'package:yaha/main.dart';
import 'package:yaha/hike/views/screens/poi-screen.dart';
import 'package:yaha/previous-activities-page.dart';
import 'package:yaha/profile/events/views/screens/event-prize-screen.dart';
import 'package:yaha/profile/events/views/screens/events.dart';
import 'package:yaha/profile/events/views/screens/ongoing-events.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/profile/statistics/statistics-screen.dart';
import 'package:yaha/profile/time-capsules/views/screens/found-timecapsules-screen.dart';
import 'package:yaha/profile/time-capsules/views/screens/my-timecapsules-screen.dart';
import 'package:yaha/profile/time-capsules/views/screens/timecapsules-screen.dart';
import 'package:yaha/search-results-screen.dart';
import 'package:yaha/settings/application/application-screen.dart';
import 'package:yaha/settings/views/settings-screen.dart';
import 'package:yaha/views/auth/screens/login-screen.dart';
import 'package:yaha/views/auth/screens/signup-screen.dart';
import 'package:yaha/views/track/screens/leave-a-timecapsule-screen.dart';
import 'package:yaha/views/track/screens/summary-screen.dart';
import 'package:yaha/views/track/screens/timecapsule-comments-screen.dart';
import 'package:yaha/views/track/screens/timecapsule-in-track-mode-screen.dart';
import 'package:yaha/views/track/screens/timecapsule-new-comments-screen.dart';
import 'package:yaha/views/track/screens/tracking-data-screen.dart';
import 'package:yaha/views/track/screens/tracking-map-screen.dart';
import 'package:yaha/views/track/screens/tracking-timecapsule-screen.dart';
import 'package:yaha/views/track/screens/tracking-timeline-screen.dart';
import 'package:yaha/views/track/screens/tracking.dart';
import 'package:yaha/views/comments/screens/commments-screen.dart';
import 'package:yaha/views/hike-outline/screens/time-capsule-info-screen.dart';
import 'package:yaha/views/track/widgets/tracking-rating-widget.dart';
import 'package:yaha/views/track/widgets/tracking-timeline-customize-widget.dart';

void main() {
  /*
  testWidgets('Yaha main smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    expect(true, true);
  });
*/
  Widget createWidgetForTesting({Widget? child}) {
    return ProviderScope(
        child: MaterialApp(
      home: child,
    ));
  }

  testWidgets('Hike Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: HikeScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Poi Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: PoiScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Profile Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: ProfilePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Settings Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: SettingsScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Application Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: ApplicationScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: SignupScreen()));
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

  testWidgets('Log In Page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: const MyApp()));
    await tester.pumpWidget(createWidgetForTesting(child: LogInScreen()));
    await tester.pumpAndSettle();
  });
  testWidgets('Event Detail Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: EventDetailScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Track Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const TrackingScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Gallery widget smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const Gallery()));

    await tester.pumpAndSettle();
  });
  testWidgets('Bottom nav bar smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const BottomNavBar()));

    await tester.pumpAndSettle();
  });
  testWidgets('Filter Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const FilterPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Explore Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: ExplorePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Previous Activities Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: PreviousActivitiesPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Hike Outline Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: HikeOutlineScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Login Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: LogInScreen()));

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
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpWidget(createWidgetForTesting(child: SignupScreen()));

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
  testWidgets('Challenges Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const Challenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('All Challenges Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AllChallenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('My Challenges Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MyChallenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('Events Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const Events()));

    await tester.pumpAndSettle();
  });
  testWidgets('All Events Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AllEvents()));

    await tester.pumpAndSettle();
  });
  testWidgets('Ongoing Events Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: OngoingEvents()));

    await tester.pumpAndSettle();
  });
  testWidgets('Statistics Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: StatisticsScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('TimeCapsules Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const TimeCapsulesScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Found TimeCapsules Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: FoundTimeCapsulesScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('My TimeCapsules Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: MyTimeCapsulesScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('TimeCapsule Info Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: TimeCapsuleInfoScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Bookmarked Hikes Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: BookmarkedHikes()));

    await tester.pumpAndSettle();
  });
  testWidgets('Most Interesting Places on Route Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: PlacesOnRouteScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Event Prize Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: EventPrizeScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Challenge Detail Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: ChallengeDetailScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Weather Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: WeatherScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('More Poi Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MorePoiScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Search Results Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: SearchResultsScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Comments Screen smoke test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(createWidgetForTesting(child: CommmentsScreen()));

      await tester.pumpAndSettle();
    });
  });
  testWidgets('Leave a TimeCapsule Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: LeaveATimeCapsuleScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const TrackingScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Map Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: TrackingMapScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Timeline Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: TrackingTimelineScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Data Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: const TrackingDataScreen(
      durationHours: 2,
      durationMins: 1,
      calories: 59,
      actualSpeed: 8,
      averageSpeed: 5,
      distanceToNext: 1.2,
      timeToNext: 15,
      distanceToFinish: 8,
      timeToFinishHours: 5,
      timeToFinishMins: 13,
      distance: 12,
      timeCapsules: 4,
    )));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking TimeCapsule Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: const TrackingTimeCapsuleScreen(collectedTimeCapsules: 4)));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Customize Timeline Widget smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: TrackingTimelineCustomizeWidget()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Rating Widget smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: TrackingRatingWidget()));

    await tester.pumpAndSettle();
  });
  testWidgets('TimeCapsule Comments Screen smoke test',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
          createWidgetForTesting(child: TimeCapsuleCommentsScreen()));

      await tester.pumpAndSettle();
    });
  });
  testWidgets('TimeCapsule in Track Mode smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: TimeCapsuleInTrackModeScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Summary Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: const SummaryScreen(
      length: 12,
      averageSpeed: 5,
      uphill: 2,
      calories: 890,
      durationHours: 3,
      durationMins: 1,
      checkpoints: 10,
      downhill: 10,
      points: 12,
    )));

    await tester.pumpAndSettle();
  });
  testWidgets('TimeCapsule New Comments Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const TimeCapsuleNewCommentsScreen()));

    await tester.pumpAndSettle();
  });
}
