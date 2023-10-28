import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:mobileapp/controllers/on_boarding_controller.dart';
import 'package:mobileapp/utils/util_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_controller.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController2());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: "asset/lottie/animation1.json",
                title: "첫번째 타이틀",
                subTitle: "첫번째 페이지 설명이 들어가야 한다.\n여러가지 설명이 포함되어야 사용자 쉽게 알 수 있다.",
              ),
              OnBoardingPage(
                image: "asset/lottie/animation_search.json",
                title: "두번째 타이틀",
                subTitle: "두번쩨 페이지 설명이 들어가야 한다.",
              ),
              OnBoardingPage(
                image: "asset/lottie/animation_settings.json",
                title: "세번째 타이틀",
                subTitle: "세번째 페이지 설명이 들어가야 한다.",
              ),
            ],
          ),

          ///Skip
          const OnBoardSkip(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          ///Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CommonUtil.isDarkMode(context);
    return Positioned(
      right: 10,
      bottom: 30,
      child: ElevatedButton(
        onPressed: (){
          OnBoardingController2.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: dark ? Colors.blue : Colors.black,
          shape: const CircleBorder(),
          side: BorderSide(
            color: dark ? Colors.blue : Colors.black
          )
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CommonUtil.isDarkMode(context);
    final controller = OnBoardingController2.instance;
    return Positioned(
        bottom: 50,
        left: 20,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? Colors.white : Colors.black, dotHeight: 6),
        ));
  }
}

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 10,
      child: TextButton(
        onPressed: () {
          OnBoardingController2.instance.skipPage();
        },
        child: Text("Skip"),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset(image, height: height * 0.5, width: width * 0.8),
          Text(
            title,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
