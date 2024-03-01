import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get homeLabel;

  /// No description provided for @settingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsLabel;

  /// No description provided for @myGoals.
  ///
  /// In en, this message translates to:
  /// **'My goals'**
  String get myGoals;

  /// No description provided for @addNewGoal.
  ///
  /// In en, this message translates to:
  /// **'Add a new goal'**
  String get addNewGoal;

  /// No description provided for @enterGoal.
  ///
  /// In en, this message translates to:
  /// **'Enter your goal (min 5, max 66 characters)'**
  String get enterGoal;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @dontShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Dont show it again'**
  String get dontShowAgain;

  /// No description provided for @activeGoals.
  ///
  /// In en, this message translates to:
  /// **'Active goals'**
  String get activeGoals;

  /// No description provided for @failedGoals.
  ///
  /// In en, this message translates to:
  /// **'Failed goals'**
  String get failedGoals;

  /// No description provided for @achievedGoals.
  ///
  /// In en, this message translates to:
  /// **'Achieved goals'**
  String get achievedGoals;

  /// No description provided for @toBeDecidedGoals.
  ///
  /// In en, this message translates to:
  /// **'Time to reflect'**
  String get toBeDecidedGoals;

  /// No description provided for @expiringGoals.
  ///
  /// In en, this message translates to:
  /// **'Expiring goals'**
  String get expiringGoals;

  /// No description provided for @onboarding_shortGoalText.
  ///
  /// In en, this message translates to:
  /// **'Harness the power of brevity! By limiting your goal text to just 66 characters, we encourage you to distill your aspirations into a clear and focused statement. This constraint fosters clarity, precision, and efficiency in expressing your goals. It pushes you to think critically about what truly matters and articulate it concisely. The beauty lies in the simplicity and impact of a short message, capturing the essence of your goal in a memorable way. So, embrace the challenge and craft your goal with precision - let every character count!'**
  String get onboarding_shortGoalText;

  /// No description provided for @onboarding_shortGoalText_title.
  ///
  /// In en, this message translates to:
  /// **'Why 66 characters?'**
  String get onboarding_shortGoalText_title;

  /// No description provided for @timeToDeadline.
  ///
  /// In en, this message translates to:
  /// **'Ends'**
  String get timeToDeadline;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @started.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get started;

  /// No description provided for @timeIsOver.
  ///
  /// In en, this message translates to:
  /// **'Time is over! Have you done it?'**
  String get timeIsOver;

  /// No description provided for @yesss.
  ///
  /// In en, this message translates to:
  /// **'YESS!!! 🎉'**
  String get yesss;

  /// No description provided for @nope.
  ///
  /// In en, this message translates to:
  /// **'NOPE 😢'**
  String get nope;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @cardDetails.
  ///
  /// In en, this message translates to:
  /// **'Card details'**
  String get cardDetails;

  /// No description provided for @cardFormNotComplete.
  ///
  /// In en, this message translates to:
  /// **'Card details are not complete'**
  String get cardFormNotComplete;

  /// No description provided for @reserveAmount.
  ///
  /// In en, this message translates to:
  /// **'Reserve \$6'**
  String get reserveAmount;

  /// No description provided for @paymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you, your commitment is active.'**
  String get paymentSuccess;

  /// No description provided for @backToGoals.
  ///
  /// In en, this message translates to:
  /// **'Back to goals'**
  String get backToGoals;

  /// No description provided for @reservationFailed.
  ///
  /// In en, this message translates to:
  /// **'We could not process your reservation.'**
  String get reservationFailed;

  /// No description provided for @justASec.
  ///
  /// In en, this message translates to:
  /// **'Just a sec...'**
  String get justASec;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @commit.
  ///
  /// In en, this message translates to:
  /// **'Commit'**
  String get commit;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @reserving.
  ///
  /// In en, this message translates to:
  /// **'Reserving \$6...'**
  String get reserving;

  /// No description provided for @emptyGoals.
  ///
  /// In en, this message translates to:
  /// **'You have no goals yet.'**
  String get emptyGoals;

  /// No description provided for @goalAchievedTitle.
  ///
  /// In en, this message translates to:
  /// **'Goal Achieved! 🎉 🎉'**
  String get goalAchievedTitle;

  /// No description provided for @goalAchievedBody.
  ///
  /// In en, this message translates to:
  /// **'Congratulations on reaching your goal! By demonstrating commitment and determination, you\'ve accomplished what you set out to do. Take a moment to reflect on your achievement and celebrate this significant milestone. Remember, success comes from your unwavering dedication. Click \'Confirm\' to claim back your \$6 and enjoy the sweet taste of victory!'**
  String get goalAchievedBody;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @goalFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to Rise Again'**
  String get goalFailedTitle;

  /// No description provided for @goalFailedBody.
  ///
  /// In en, this message translates to:
  /// **'Although this attempt may not have resulted in the desired outcome, don\'t let it deter you from pursuing your goals. Remember, setbacks are stepping stones to success. Take this opportunity to learn from your experience and use it as fuel to ignite your determination. By clicking \'Confirm,\' you can release the payment, acknowledging the setback while embracing the valuable lessons it has taught you. Rise up, reset your goals, and embark on a new journey towards achievement. Your determination will lead you to greatness.'**
  String get goalFailedBody;

  /// No description provided for @intro1.
  ///
  /// In en, this message translates to:
  /// **'Set Your Goal: Define a specific goal you want to achieve within the next 6 days.'**
  String get intro1;

  /// No description provided for @intro2.
  ///
  /// In en, this message translates to:
  /// **'Commit & Risk: Commit to your goal by risking \$6. This adds a layer of accountability and motivation.'**
  String get intro2;

  /// No description provided for @intro3.
  ///
  /// In en, this message translates to:
  /// **'Take Daily Actions: Take daily actions towards your goal and track your progress within the app.'**
  String get intro3;

  /// No description provided for @intro4.
  ///
  /// In en, this message translates to:
  /// **'Not Achieved Your Goal? If you don\'t achieve your goal within the specified time, you\'ll have the option to release the \$6, motivating you to reflect on the reasons behind the setback and encouraging you to try again.'**
  String get intro4;

  /// No description provided for @intro5.
  ///
  /// In en, this message translates to:
  /// **'Reach Your Goal: Stay focused and determined for 6 days, consistently working towards your target.'**
  String get intro5;

  /// No description provided for @intro6.
  ///
  /// In en, this message translates to:
  /// **'Celebrate & Succeed: Upon achieving your goal, unlock a well-deserved reward and feel the satisfaction of accomplishing what you set out to do. Plus, there\'s no financial risk involved if you achieve your goal.'**
  String get intro6;

  /// No description provided for @howDoesItWork.
  ///
  /// In en, this message translates to:
  /// **'How does it work?'**
  String get howDoesItWork;

  /// No description provided for @startToday.
  ///
  /// In en, this message translates to:
  /// **'Start today!'**
  String get startToday;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signInSlogan.
  ///
  /// In en, this message translates to:
  /// **'Unlock your potential, set meaningful goals, and achieve greatness with 6Days. Sign in now and embark on a transformative journey of personal growth. Make every day count!'**
  String get signInSlogan;

  /// No description provided for @registerSlogan.
  ///
  /// In en, this message translates to:
  /// **'Unlock your potential, set meaningful goals, and achieve greatness with 6Days. Register now and embark on a transformative journey of personal growth. Make every day count!'**
  String get registerSlogan;

  /// No description provided for @acceptRegisterTerms.
  ///
  /// In en, this message translates to:
  /// **'By registering, you agree to our terms and conditions.'**
  String get acceptRegisterTerms;

  /// No description provided for @acceptSigninTerms.
  ///
  /// In en, this message translates to:
  /// **'By signing in, you agree to our terms and conditions.'**
  String get acceptSigninTerms;

  /// No description provided for @startImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Apollo, Athena, Saraswati and Thoth are walking the Camino in sunrise'**
  String get startImageTitle;

  /// No description provided for @godExplanation.
  ///
  /// In en, this message translates to:
  /// **'Apollo, Athena, Saraswati and Thoth are gods related to knowledge, wisdom, and personal growth.'**
  String get godExplanation;

  /// No description provided for @introExplanation1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the realm of 6Days, where your journey towards success begins with a bold commitment and a fearless mindset. This innovative app empowers you to set audacious goals and transform them into a reality, all while leveraging the power of risk and reward.'**
  String get introExplanation1;

  /// No description provided for @introExplanation2.
  ///
  /// In en, this message translates to:
  /// **'In the world of 6Days, you are invited to embrace the concept of committing to your goals for just six days, and here\'s the remarkable part: if you succeed in achieving your goal, there is no risk whatsoever. By taking the leap and risking \$6, you are immersing yourself in a world where growth and prosperity await.'**
  String get introExplanation2;

  /// No description provided for @introExplanation3.
  ///
  /// In en, this message translates to:
  /// **'Like the renowned financial guru Robert Kiyosaki teaches us, true wealth lies in taking calculated risks and pushing beyond our comfort zones. With 6Days, you have the opportunity to harness this wisdom and apply it directly to your journey.'**
  String get introExplanation3;

  /// No description provided for @introExplanation4.
  ///
  /// In en, this message translates to:
  /// **'Imagine the thrill of witnessing your aspirations come to life, as each successful goal attainment takes you one step closer to financial freedom. Through this unique concept, 6Days empowers you to develop the habits of the rich and adopt a mindset that attracts abundance into your life.'**
  String get introExplanation4;

  /// No description provided for @introExplanation5.
  ///
  /// In en, this message translates to:
  /// **'So, are you ready to embark on this exhilarating adventure? Join the ranks of those who understand that embracing calculated risks and committing to their goals is the surefire path to prosperity. Unleash your potential, conquer your fears, and ignite the flame of success within you.'**
  String get introExplanation5;

  /// No description provided for @introExplanation6.
  ///
  /// In en, this message translates to:
  /// **'Dare to take the leap with 6Days, and let the world witness the extraordinary wealth and abundance you can create. Better yourself awaits!'**
  String get introExplanation6;

  /// No description provided for @dailyCheckin.
  ///
  /// In en, this message translates to:
  /// **'Daily Check-in'**
  String get dailyCheckin;

  /// No description provided for @dailyCheckinInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Check-in: Unlock Your Potential!'**
  String get dailyCheckinInfoTitle;

  /// No description provided for @dailyCheckinInfoSummary.
  ///
  /// In en, this message translates to:
  /// **'Experience the power of daily check-ins on your journey towards success. 6Days is designed to keep you on track and accountable for your goals. By engaging in a brief daily check-in, you tap into a range of benefits:'**
  String get dailyCheckinInfoSummary;

  /// No description provided for @dailyCheckinInfoBody1.
  ///
  /// In en, this message translates to:
  /// **'Stay Focused. Each day, you\'ll receive a gentle reminder to reflect on your progress and refocus your efforts. It\'s a simple yet powerful way to maintain your motivation and keep your goals top of mind.'**
  String get dailyCheckinInfoBody1;

  /// No description provided for @dailyCheckinInfoBody2.
  ///
  /// In en, this message translates to:
  /// **'Measure Your Success. Our check-in feature allows you to track your progress over time. By regularly assessing your achievements, you gain valuable insights into your growth and can celebrate your wins along the way.'**
  String get dailyCheckinInfoBody2;

  /// No description provided for @dailyCheckinInfoBody3.
  ///
  /// In en, this message translates to:
  /// **'Boost Accountability. By committing to a daily check-in, you hold yourself accountable for taking consistent action towards your goals. It\'s a commitment that keeps you motivated and propels you forward.'**
  String get dailyCheckinInfoBody3;

  /// No description provided for @dailyCheckinInfoBody4.
  ///
  /// In en, this message translates to:
  /// **'Foster Self-Awareness. The daily check-in encourages self-reflection, enabling you to deepen your understanding of what drives you and what obstacles you may face. This heightened self-awareness empowers you to make intentional choices aligned with your aspirations.'**
  String get dailyCheckinInfoBody4;

  /// No description provided for @dailyCheckinInfoClosure.
  ///
  /// In en, this message translates to:
  /// **'Don\'t miss out on the benefits of daily check-ins. Start your motivational journey today and witness the positive impact it can have on your life. Remember, every small step counts towards your extraordinary achievements!'**
  String get dailyCheckinInfoClosure;

  /// No description provided for @dailyNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Review Your Goals'**
  String get dailyNotificationTitle;

  /// No description provided for @dailyNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Take a moment to reflect on your objectives! 🎯'**
  String get dailyNotificationBody;

  /// No description provided for @dailyReminderTime.
  ///
  /// In en, this message translates to:
  /// **'Daily reminder time'**
  String get dailyReminderTime;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get enableNotifications;

  /// No description provided for @goalDeleted.
  ///
  /// In en, this message translates to:
  /// **'Goal deleted.'**
  String get goalDeleted;

  /// No description provided for @goalArchived.
  ///
  /// In en, this message translates to:
  /// **'Goal archived.'**
  String get goalArchived;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettings;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @payWithApplePay.
  ///
  /// In en, this message translates to:
  /// **'Pay now'**
  String get payWithApplePay;

  /// No description provided for @confirmArchive.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to archive?'**
  String get confirmArchive;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get confirmDelete;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
