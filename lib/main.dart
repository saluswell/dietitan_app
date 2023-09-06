import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/providers/appointmentProvider.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/providers/available_time_slots.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/providers/authProvider.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/providers/savUserDetailsProvider.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/bankingInformation.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/createAccountScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/loginScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/personalInformationScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/professionalInformationScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/splashScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/providers/nuttrition_Care_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/dashboardsection/provider/bottom_navbar_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/dashboardsection/screens/bottomNavScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/dashboardsection/screens/homeScreen.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/providers/meal_plan_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/notesSection/providers/soap_note_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/notificationSection/handlers/notification_handler.dart';
import 'package:saluswell_dietitan_app_updated/src/onboardingsection/screens/onboardingscreen_one.dart';
import 'package:saluswell_dietitan_app_updated/src/onboardingsection/screens/onboardingscreen_three.dart';
import 'package:saluswell_dietitan_app_updated/src/onboardingsection/screens/onboardingscreen_two.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/providers/recipes_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/resourcesSection/healthTipsSection/providers/resourceProvider.dart';
import 'package:saluswell_dietitan_app_updated/src/reviewsSection/providers/review_provider.dart';

import 'common/helperFunctions/navigatorHelper.dart';
import 'common/utils/themes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  createNotification(
    title: message.data['title'].toString(),
    body: message.data['body'].toString(),
  );
}

Future<void> createNotification(
    {required String title, required String body}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1, channelKey: 'basic_channel', title: title, body: body),
  );
}

///starting point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  NotificationController.initializeLocalNotifications().then((value) {
    //  print(value);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
      // DevicePreview(
      // enabled: !kReleaseMode, builder: (context) =>
      const MyApp());

  //);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    //  initAgora();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
    FirebaseMessaging.onMessage.listen((message) {
      createNotification(
        title: message.data['title'].toString(),
        body: message.data['body'].toString(),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      createNotification(
        title: message.data['title'].toString(),
        body: message.data['body'].toString(),
      );
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ResourceProvider()),
        ChangeNotifierProvider(create: (context) => SoapNoteProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
        ChangeNotifierProvider(create: (context) => TimeSlotProvider()),
        ChangeNotifierProvider(create: (context) => DiagnosticProvider()),
        ChangeNotifierProvider(create: (context) => MealPlanProvider()),
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
      ],
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            navigatorKey: navstate,
            // builder: DevicePreview.appBuilder,
            theme: AppTheme.themeData,
            routes: {
              LoginScreen.routeName: (context) => LoginScreen(),
              CreateAccountScreen.routeName: (context) =>
                  const CreateAccountScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              BottomNavScreen.routeName: (context) => const BottomNavScreen(),
              OnBoardingScreenOne.routeName: (context) =>
                  const OnBoardingScreenOne(),
              OnBoardingScreenTwo.routeName: (context) =>
                  const OnBoardingScreenTwo(),
              OnBoardingScreenThree.routeName: (context) =>
                  const OnBoardingScreenThree(),
              PersonalInformationScreen.routeName: (context) =>
                  const PersonalInformationScreen(),
              BankingInformationScreen.routeName: (context) =>
                  const BankingInformationScreen(),
              ProfessionalInformationScreen.routeName: (context) =>
                  const ProfessionalInformationScreen(),
            },
            home: SplashScreen()),
      ),
    );
  }
}
