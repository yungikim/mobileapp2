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
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingConter1,
          bgColor: tOnBoardingPage1Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tOnBoardingTitle2,
          subTitle: tOnBoardingSubTitle2,
          counterText: tOnBoardingConter2,
          bgColor: tOnBoardingPage2Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tOnBoardingTitle3,
          subTitle: tOnBoardingSubTitle3,
          counterText: tOnBoardingConter3,
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