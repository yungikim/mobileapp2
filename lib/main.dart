import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobileapp/sample_page.dart';
import 'package:mobileapp/utils/theme/theme.dart';
import 'features/screens/splash/splashscreen.dart';

//앱에서 지원하는 언어 리스트 변수
final supportedLocales =[
  Locale('en','US'),
  Locale('ko','KR'),
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
