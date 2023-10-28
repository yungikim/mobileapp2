import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';

class OnBoardingController2 extends GetxController{
  static OnBoardingController2 get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  /// Jump to the specific dot selectdd page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage(){
    if (currentPageIndex.value == 2){
      Get.offAll(() => LoginAppSample());
    }else{
      pageController.jumpToPage(currentPageIndex.value +1);
    }
  }

  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}