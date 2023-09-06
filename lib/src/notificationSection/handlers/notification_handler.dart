import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/navigatorHelper.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/showsnackbar.dart';

import '../../../common/utils/appcolors.dart';

class NotificationController {
  static ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        'resource://drawable/notificationlogo',
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: 'basic description',
            defaultColor: AppColors.appcolor,
            importance: NotificationImportance.High,
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            defaultPrivacy: NotificationPrivacy.Private,
            ledColor: AppColors.appcolor,
            //channelShowBadge: true,
          ),
          NotificationChannel(
            channelKey: 'alerts',
            channelName: 'Alerts',
            channelDescription: 'Notification tests as alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: AppColors.appcolor,
            ledColor: AppColors.appcolor,
          )
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS LISTENER
  ///  *********************************************
  ///  Notifications events are only delivered after call this method
  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      navstate.currentState?.pushNamedAndRemoveUntil(
          '/notification-page',
          (route) =>
              (route.settings.name != '/notification-page') || route.isFirst,
          arguments: receivedAction);
    }
  }

  ///  *********************************************
  ///     REQUESTING NOTIFICATION PERMISSIONS
  ///  *********************************************
  ///
  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = navstate.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/animated-bell.gif',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  ///  *********************************************
  ///     BACKGROUND TASKS TEST
  ///  *********************************************
  static Future<void> executeLongTaskInBackground() async {
    print("starting long task");
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    final re = await http.get(url);
    print(re.body);
    print("long task done");
  }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
  ///
  static Future<void> createNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            // -1 is replaced by a random number
            channelKey: 'alerts',
            title: 'Huston! The eagle has landed!',
            body:
                "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'notificationId': '1234567890'}),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'REPLY',
              label: 'Reply Message',
              requireInputText: true,
              actionType: ActionType.SilentAction),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ]);
  }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            // -1 is replaced by a random number
            channelKey: 'alerts',
            title: "Huston! The eagle has landed!",
            body:
                "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
              'notificationId': '1234567890'
            }),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ],
        schedule: NotificationInterval(
            interval: 5,
            //  repeats: true,
            timeZone:
                await AwesomeNotifications().getLocalTimeZoneIdentifier()));
    //schedule: NotificationInterval(interval: interval)
    // schedule: NotificationCalendar.fromDate(
    //     repeats: true,
    //     preciseAlarm: true,
    //     date: DateTime.now().add(const Duration(seconds: 30)))
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  static Future<void> testNotification() async {
    var indentifier = await AwesomeNotifications().listScheduledNotifications();
    print(indentifier);
  }

  static Future<void> showBadgeNotification(int id, {int? badgeAmount}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            badge: badgeAmount,
            channelKey: 'alerts',
            title: 'Badge test notification',
            body: 'This notification does activate badge indicator',
            payload: {'content 1': 'value'}),
        schedule: NotificationInterval(
            interval: 1,
            repeats: true,
            preciseAlarm: true,
            allowWhileIdle: false,
            timeZone:
                await AwesomeNotifications().getLocalTimeZoneIdentifier()));
  }

  /* *********************************************
      NOTIFICATION'S SPECIAL CATEGORIES
  ************************************************ */

  // static Future<void> showCallNotification(int id, int timeToWait) async {
  //   String platformVersion = await getPlatformVersion();
  //   // Schedule only for test purposes. For real applications, you MUST
  //   // create call or alarm notifications using AndroidForegroundService.
  //   await AwesomeNotifications().createNotification(
  //     // await AndroidForegroundService.startAndroidForegroundService(
  //     //     foregroundStartMode: ForegroundStartMode.stick,
  //     //     foregroundServiceType: ForegroundServiceType.phoneCall,
  //       content: NotificationContent(
  //           id: id,
  //           channelKey: 'alerts',
  //           title: 'Incoming Call',
  //           body: 'from Little Mary',
  //           category: NotificationCategory.Call,
  //           largeIcon: 'asset://assets/images/girl-phonecall.jpg',
  //           wakeUpScreen: true,
  //           fullScreenIntent: true,
  //           autoDismissible: false,
  //           backgroundColor: (platformVersion == 'Android-31')
  //               ? const Color(0xFF00796a)
  //               : Colors.white,
  //           payload: {'username': 'Little Mary'}),
  //       actionButtons: [
  //         NotificationActionButton(
  //             key: 'ACCEPT',
  //             label: 'Accept Call',
  //             actionType: ActionType.Default,
  //             color: Colors.green,
  //             autoDismissible: true),
  //         NotificationActionButton(
  //             key: 'REJECT',
  //             label: 'Reject',
  //             actionType: ActionType.SilentAction,
  //             isDangerousOption: true,
  //             autoDismissible: true),
  //       ],
  //       schedule: NotificationInterval(interval: timeToWait));
  // }

  static Future<void> showAlarmNotification(
      {required int id, int secondsToWait = 30, int snoozeSeconds = 30}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'alerts',
            title: 'Alarm is playing',
            body: 'Hey! Wake Up!',
            category: NotificationCategory.Alarm,
            autoDismissible: true,
            payload: {'snooze': '$snoozeSeconds'}),
        actionButtons: [
          NotificationActionButton(
              key: 'SNOOZE',
              label: 'Snooze for $snoozeSeconds seconds',
              color: Colors.blue,
              actionType: ActionType.SilentBackgroundAction,
              autoDismissible: true),
        ],
        schedule: (secondsToWait < 5)
            ? null
            : NotificationCalendar.fromDate(
                date: DateTime.now().add(Duration(seconds: secondsToWait))));
  }

  ///repeate notifications

  static Future<void> repeatPreciseThreeTimes() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Notification scheduled to play precisely 3 times',
          body: 'This notification was schedule to play precisely 3 times.',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
        ),
        schedule: NotificationAndroidCrontab(preciseSchedules: [
          DateTime.now().toLocal(),
          //  DateTime.now().add(const Duration(seconds: 30))
          //    DateTime.now().add(Duration(seconds: 10)).toUtc(),
          // DateTime.now().add(Duration(seconds: 25)).toUtc(),
          // DateTime.now().add(Duration(seconds: 45)).toUtc()
        ], repeats: true));
  }

  static Future<void> repeatMinuteNotificationOClock() async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            channelKey: 'alerts',
            title: 'Meeting Time Alert',
            body: 'Meeting will end after 20 minutes',
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture: 'asset://assets/images/melted-clock.png'),
        schedule: NotificationCalendar(
            preciseAlarm: true,
            minute: 10,
            second: 0,
            millisecond: 0,
            timeZone: localTimeZone,
            repeats: true));
  }

  ///progress bar notification

  static int currentStep = 0;
  static Timer? udpateNotificationAfter1Second;

  static Future<void> showProgressNotification(int id) async {
    int maxStep = 10;
    int fragmentation = 4;
    for (var simulatedStep = 1;
        simulatedStep <= maxStep * fragmentation + 1;
        simulatedStep++) {
      currentStep = simulatedStep;
      await Future.delayed(Duration(milliseconds: 1000 ~/ fragmentation));
      if (udpateNotificationAfter1Second != null) continue;
      udpateNotificationAfter1Second = Timer(const Duration(seconds: 1), () {
        _updateCurrentProgressBar(
            id: id,
            simulatedStep: currentStep,
            maxStep: maxStep * fragmentation);
        udpateNotificationAfter1Second?.cancel();
        udpateNotificationAfter1Second = null;
      });
    }
  }

  static void _updateCurrentProgressBar({
    required int id,
    required int simulatedStep,
    required int maxStep,
  }) {
    if (simulatedStep < maxStep) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: id,
              channelKey: 'alerts',
              title: 'Download finished',
              body: 'filename.txt',
              category: NotificationCategory.Progress,
              payload: {
                'file': 'filename.txt',
                'path': '-rmdir c://ruwindows/system32/huehuehue'
              },
              locked: false));
    } else {
      int progress = min((simulatedStep / maxStep * 100).round(), 100);
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: id,
              channelKey: 'alerts',
              title: 'Downloading fake file in progress ($progress%)',
              body: 'filename.txt',
              category: NotificationCategory.Progress,
              payload: {
                'file': 'filename.txt',
                'path': '-rmdir c://ruwindows/system32/huehuehue'
              },
              notificationLayout: NotificationLayout.ProgressBar,
              progress: progress,
              locked: true));
    }
  }

  static Future<void> showIndeterminateProgressNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'alerts',
            title: 'Downloading fake file...',
            body: 'filename.txt',
            category: NotificationCategory.Progress,
            payload: {
              'file': 'filename.txt',
              'path': '-rmdir c://ruwindows/system32/huehuehue'
            },
            notificationLayout: NotificationLayout.ProgressBar,
            progress: null,
            locked: true));
  }

  static Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
    dp(msg: "Notification stopped", arg: id);
  }
}
