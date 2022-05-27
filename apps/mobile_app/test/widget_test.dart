// This is a basic Flutter widget test.  To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/views/achievements/explore/screens/a-explore.dart';
import 'package:yaha/app/views/achievements/home/screens/a-home-screen.dart';
import 'package:yaha/app/views/achievements/market/screens/a-market-screen.dart';
import 'package:yaha/app/views/auth/screens/login-screen.dart';
import 'package:yaha/app/views/auth/screens/signup-screen.dart';
import 'package:yaha/app/views/hikes/events/screens/all-events.dart';
import 'package:yaha/app/views/hikes/events/screens/event-detail-screen.dart';
import 'package:yaha/app/views/hikes/events/screens/event-prize-screen.dart';
import 'package:yaha/app/views/hikes/events/screens/events.dart';
import 'package:yaha/app/views/hikes/events/screens/ongoing-events.dart';
import 'package:yaha/app/views/hikes/hike/screens/explore-screen.dart';
import 'package:yaha/app/views/hikes/hike/screens/hike-filter-screen.dart';
import 'package:yaha/app/views/hikes/hike/screens/hike-outline-screen.dart';
import 'package:yaha/app/views/hikes/home/views/screens/guest-home-screen.dart';
import 'package:yaha/app/views/hikes/hike/screens/search-results-screen.dart';
import 'package:yaha/app/views/hikes/hike/screens/weather-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/all-challenges.dart';
import 'package:yaha/app/views/hikes/personal/screen/application-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/bookmarked-hikes.dart';
import 'package:yaha/app/views/hikes/personal/screen/challenge-detail-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/challenges.dart';
import 'package:yaha/app/views/hikes/personal/screen/my-challenges.dart';
import 'package:yaha/app/views/hikes/personal/screen/profile-page.dart';
import 'package:yaha/app/views/hikes/personal/screen/settings-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/statistics-screen.dart';
import 'package:yaha/app/views/shared/widgets/bottom-nav-bar-widget.dart';
import 'package:yaha/app/views/starting-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/leave-a-timecapsule-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/summary-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/timecapsule-in-track-mode-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/timecapsule-new-comments-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking-data-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking-map-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking-timecapsule-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking-timeline-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking.dart';
import 'package:yaha/app/views/hikes/track/widgets/tracking-rating-widget.dart';
import 'package:yaha/app/views/hikes/track/widgets/tracking-timeline-customize-widget.dart';
import 'package:yaha/domain/entities/hike/hike.dart';
import 'package:yaha/domain/entities/shared/linestring.dart';
import 'package:yaha/domain/entities/shared/textual-description.dart';
import 'package:yaha/main.dart';

final hikeFixture = Hike(
    id: 'id',
    description: [
      TextualDescription(
          languageKey: 'hu_hu',
          title: 'Title',
          summary: 'Summary',
          type: 'markdown')
    ],
    route: LineStringData(type: "LineString", coordinates: const [
      [0.0, 0.0]
    ]));

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

  /*testWidgets('Hike Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: HikeScreen(hike: hikeFixture)));

    await tester.pumpAndSettle();
  });
  testWidgets('Poi Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: PoiScreen()));

    await tester.pumpAndSettle();
  });
  */
  testWidgets('Profile Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const ProfilePage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Settings Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const SettingsScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Application Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const ApplicationScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Sign Up Page smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const SignupScreen()));
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
    await tester.pumpWidget(createWidgetForTesting(child: const LogInScreen()));
    await tester.pumpAndSettle();
  });
  testWidgets('Event Detail Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const EventDetailScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Track Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const TrackingScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('GalleryWidget widget smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const GalleryWidget()));

    await tester.pumpAndSettle();
  });*/
  /*testWidgets('Bottom nav bar smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: const BottomNavBarWidget(
          firstScreen: HomePageGuest(),
          firstScreenIcon: Icons.home_rounded,
          firstScreenName: 'Home',
          secondScreen: TimeCapsuleNewCommentsScreen(),
          secondScreenIcon: Icons.travel_explore,
          secondScreenName: 'Explore',
          thirdScreen: TrackingScreen(),
          thirdScreenIcon: Icons.play_circle_fill,
          thirdScreenName: 'Track',
          fourthScreen: ProfilePage(),
          fourthScreenIcon: Icons.face_rounded,
          fourthScreenName: 'Profile',
        ),
      ),
    );

    await tester.pumpAndSettle();
  });*/
  testWidgets('Filter Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const HikeFilterPage()));

    await tester.pumpAndSettle();
  });
  testWidgets('Explore Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const ExploreScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Previous Activities Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const PreviousActivitiesScreen()));

    await tester.pumpAndSettle();
  });*/
  testWidgets('Hike Outline Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const HikeOutlineScreen()));

    await tester.pumpAndSettle();
  });
  testWidgets('Login Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const LogInScreen()));

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
    await tester
        .pumpWidget(createWidgetForTesting(child: const SignupScreen()));

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
    await tester
        .pumpWidget(createWidgetForTesting(child: const AllChallenges()));

    await tester.pumpAndSettle();
  });
  testWidgets('My Challenges Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const MyChallenges()));

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
    await tester
        .pumpWidget(createWidgetForTesting(child: const OngoingEvents()));

    await tester.pumpAndSettle();
  });
  testWidgets('Statistics Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const StatisticsScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('TimeCapsules Screen smoke test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
          createWidgetForTesting(child: const TimeCapsulesScreen()));
      await tester.pumpAndSettle();
    });
  });
  testWidgets('Found TimeCapsules Screen smoke test',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(createWidgetForTesting(child: FoundTimeCapsulesScreen()));

      await tester.pumpAndSettle();
    });
  });
  testWidgets('My TimeCapsules Screen smoke test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(createWidgetForTesting(child: MyTimeCapsulesScreen()));

      await tester.pumpAndSettle();
    });
  });
  testWidgets('TimeCapsule Info Screen smoke test',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester
          .pumpWidget(createWidgetForTesting(child: TimeCapsuleInfoScreen()));

      await tester.pumpAndSettle();
    });
  });*/
  testWidgets('Bookmarked Hikes Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const BookmarkedHikes()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Most Interesting Places on Route Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const PlacesOnRouteScreen()));

    await tester.pumpAndSettle();
  });*/
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
    await tester
        .pumpWidget(createWidgetForTesting(child: const WeatherScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('More Poi Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MorePoiScreen()));

    await tester.pumpAndSettle();
  });
  */
  testWidgets('Search Results Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const SearchResultsScreen()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('Comments Screen smoke test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(createWidgetForTesting(child: CommmentsScreen()));

      await tester.pumpAndSettle();
    });
  });*/
  testWidgets('Leave a TimeCapsule Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const LeaveATimeCapsuleScreen()));

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
    await tester.pumpWidget(
        createWidgetForTesting(child: const TrackingTimelineScreen()));

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
        createWidgetForTesting(child: const TrackingTimelineCustomizeWidget()));

    await tester.pumpAndSettle();
  });
  testWidgets('Tracking Rating Widget smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const TrackingRatingWidget()));

    await tester.pumpAndSettle();
  });
  /*testWidgets('TimeCapsule Comments Screen smoke test',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
          createWidgetForTesting(child: TimeCapsuleCommentsScreen()));

      await tester.pumpAndSettle();
    });
  });*/
  testWidgets('TimeCapsule in Track Mode smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: const TimeCapsuleInTrackModeScreen()));

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

  testWidgets('Starting Screen smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const StartingScreen()));

    await tester.pumpAndSettle();
  });

  testWidgets('Achievements Home Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: const AHomeScreen()));

    await tester.pumpAndSettle();
  });

  testWidgets('Achievements Explore Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const AExploreScreen()));

    await tester.pumpAndSettle();
  });

  testWidgets('Achievements Market Screen smoke test',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: const AMarketScreen()));

    await tester.pumpAndSettle();
  });
}
