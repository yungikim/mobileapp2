import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';

import '../constants/colors.dart';
import '../constants/image_strings.dart';
import '../constants/text_strings.dart';
import '../features/models/model_on_boarding.dart';
import '../features/screens/on_boarding/widget/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController{
  final controller = LiquidController();
  RxInt currentPage  = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tr('tOnBoardingTitle1'),
          subTitle: tr('tOnBoardingSubTitle1'),
          counterText: tr('tOnBoardingConter1'),
          bgColor: tOnBoardingPage1Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tr('tOnBoardingTitle2'),
          subTitle: tr('tOnBoardingSubTitle2'),
          counterText: tr('tOnBoardingConter2'),
          bgColor: tOnBoardingPage2Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tr('tOnBoardingTitle3'),
          subTitle: tr('tOnBoardingSubTitle3'),
          counterText: tr('tOnBoardingConter3'),
          bgColor: tOnBoardingPage3Color),
    ),
  ];

  onPageChangeCallback(int activatPageIndex){
      currentPage.value = activatPageIndex;
  }

  skip() => controller.jumpToPage(page: 2);

  animateNextSlide(){
    print(controller.currentPage);
    if (controller.currentPage == 2){
      Get.off(() => const LoginScreen());
    }
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

}