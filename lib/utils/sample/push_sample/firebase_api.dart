import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../firebase_options.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;
  //create an instance of Firebase Messaging

  //function to initialize notifications



  Future<void> initNotifications() async{
    //request permission from user (will prompt user)
    //await _firebaseMessaging.requestPermission();

    //fetch the FCm token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    //print the token (normally you would send this to your server)
    print('Token : ${fCMToken}');

    //initPushNotification();
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );


    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notification',
        importance: Importance.high,
        playSound: true
    );

    var initialzationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,
      iOS: initialzationSettingsIOS
    );
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.getActiveNotifications();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);


    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      print('Got a message whilst in the foreground!');
      print('Message data : ${message.data}');
      if (notification != null){
        print('Message also contained a notification : ${notification.title}');
        print('body : ${notification.body}');
      }

      if (message.notification != null && android !=null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification?.title,
            notification?.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  icon: "@mipmap/ic_launcher",
                )
            )
        );
      }
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message){
    //   print('Got a message whilst in the foreground!');
    //   print('Message data : ${message.data}');
    //   final notification = message.notification;
    //   if (notification != null){
    //     print('Message also contained a notification : ${notification.title}');
    //     print('body : ${notification.body}');
    //   }
    // });



    //토큰 리프레시 수신되면 서버에 다시 저장해야 한다.
    try {
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async{
        //여기서 서버에 토큰을 저장한다
        print("여기서 사용자 토큰 정보를 서버에 저장해야 한다.");
      });
    } catch (e, s) {
      print(s);
    }

  }

  //function to handle received messages

  //function to initialize foreground and background settings
  // void handleBackgroundMessage(RemoteMessage? message){
  //   print("Background Message receive");
  //   print("Handling a background message ${message?.messageId}");
  //   if (message == null) return;
  //
  //   print('Title: ${message.notification!.title}');
  //   print('Body: ${message.notification!.body}');
  //   print('Payload : ${message.data}');
  //
  // }
  //
  // Future initPushNotification() async{
  //   //handle notification if the app was terminated and now opend
  //   FirebaseMessaging.instance.getInitialMessage().then(handleBackgroundMessage);
  //
  //   //attach event listeners for when a notification opens the app
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
  //
  // }
  //@pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
    //If you're going to use other Firebase services in the background, such as Firestore,
    //make sure you call 'initializeApp' before using other Firebase services.

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print("Handling a background message ${message.messageId}");
  }

}