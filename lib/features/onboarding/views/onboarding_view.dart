import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_images.dart';
import 'package:zumda/theme/app_text_styles.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) => onboardingPages[index],
              onPageChanged: (value) {
                selectedIndex = value;
                setState(() {});
              },
            ),
            Positioned(
                bottom: 90.h,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.primaryColor),
                          height: 4.h,
                          width: selectedIndex == i ? 24.w : 4.w,
                        )
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledAppButton(
        buttonName: 'Get Started',
        onTap: () {
          context.goNamed(RouteNames.signIn);
        },
      ),
    );
  }
}

List<Widget> onboardingPages = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SizedBox(
          height: 280.h,
          width: 280.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.device,
                height: 400.h,
                width: 200.w,
              ),
              Image.asset(
                AppImages.illustration,
                height: 240.h,
                width: 240.h,
              )
            ],
          ),
        ),
      ),
      ScreenUtil().setVerticalSpacing(40),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Text(
          'Finance app the safest and most trusted',
          style: AppTextStyles.labelStyle1,
          textAlign: TextAlign.center,
        ),
      ),
      ScreenUtil().setVerticalSpacing(16),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Text(
          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
          style: AppTextStyles.labelStyle7,
          textAlign: TextAlign.center,
        ),
      )
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SizedBox(
          height: 280.h,
          width: 280.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.device2,
                height: 400.h,
                width: 200.w,
              ),
              Image.asset(
                AppImages.illustration2,
                height: 240.h,
                width: 240.h,
              )
            ],
          ),
        ),
      ),
      ScreenUtil().setVerticalSpacing(40),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Text(
          'The fastest transaction process only here',
          style: AppTextStyles.labelStyle1,
          textAlign: TextAlign.center,
        ),
      ),
      ScreenUtil().setVerticalSpacing(16),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Text(
          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
          style: AppTextStyles.labelStyle7,
          textAlign: TextAlign.center,
        ),
      )
    ],
  ),
];
