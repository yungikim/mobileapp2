import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobileapp/firebase_options.dart';
import 'package:mobileapp/sample_page.dart';
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';
import 'package:mobileapp/utils/sample/push_sample/firebase_api.dart';
import 'package:mobileapp/utils/theme/theme.dart';
import 'package:notification_when_app_is_killed/model/args_for_ios.dart';
import 'features/screens/splash/splashscreen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import 'package:flutter/services.dart';
import 'package:notification_when_app_is_killed/model/args_for_ios.dart' as ioslocal;
import 'package:notification_when_app_is_killed/model/args_for_kill_notification.dart';
import 'package:notification_when_app_is_killed/notification_when_app_is_killed.dart';
import 'dart:async';



//앱에서 지원하는 언어 리스트 변수
final supportedLocales =[
  Locale('en','US'),
  Locale('ko','KR'),
];

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  //If you're going to use other Firebase services in the background, such as Firestore,
  //make sure you call 'initializeApp' before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message ${message.messageId}");
  final notification = message.notification;
  if (notification != null){
    print('Background Message also contained a notification : ${notification.title}');
    print('Background body : ${notification.body}');


    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notification',
        importance: Importance.high,
        playSound: true
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    AndroidNotification? android = message.notification?.android;
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
  }
}


Future<void> setNotificationOnKill() async {
  print("###########setNotificationOnKill###########");
  bool success = true;
  final _notificationWhenAppIsKilledPlugin = NotificationWhenAppIsKilled();
  try {
    ArgsForIos argsForIos = ArgsForIos(
      interruptionLevel: ioslocal.InterruptionLevel.critical,
      useDefaultSound: true,
    );
    success =
        await _notificationWhenAppIsKilledPlugin.setNotificationOnKillService(
          ArgsForKillNotification(
              title: 'The app is killed',
              description:
              'You can see this notification when the app is killed',
              argsForIos: argsForIos),
        ) ??
            false;
  } on PlatformException {
    success = false;
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{
  HttpOverrides.global = new MyHttpOverrides();  //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  setNotificationOnKill();

  kakao.KakaoSdk.init(nativeAppKey: 'b518f7790732911b6fb384439e147353');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  

  runApp(
    EasyLocalization(
      //지원하는 언어 리스트
      supportedLocales: supportedLocales,
      //path: 언어 파일 경로
      path: 'asset/translations',
      //fallbackLocale supportedLocales에 대한 설정한 언어가 없는 경우 설정되는 언어
      fallbackLocale: Locale('ko','KR'),
      //startLocale을 지정하면 초기 언어가 설정한 언어로 변경됨
      //만일 이 설정을 하지 않으면 os 언어를 따라 기본 언어가 설정됨
      //startLocale: Locale('ko', 'KR'),
      child: _App(),
    ),
  );
}



class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //EasyLocalization.of(context)!.setLocale(const Locale('ko','KR'));

    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,


      home: const SamplePage(),
    );
  }
}


// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true as bool Function(X509Certificate cert, String host, int port)?;
//   }
// }