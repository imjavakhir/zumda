import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_images.dart';
import 'package:zumda/theme/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        actions: [
          IconButton(
              splashRadius: 24.r,
              enableFeedback: false,
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.notification,
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 244.h,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 8.r,
                  color: AppColors.cardShadow,
                  offset: const Offset(0, 8))
            ]),
            width: double.maxFinite,
            child: PageView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.green),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Image.asset(
                          index % 2 == 0
                              ? AppImages.visa
                              : AppImages.mastercard,
                          height: 48.h,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Balance: \$15800 ',
                          //   style: AppTextStyles.labelStyle3.copyWith(
                          //       color: AppColors.white,
                          //       fontFamily: AppTextStyles.satoshiBold),
                          // ),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.chip,
                                height: 32.h,
                              ),
                              ScreenUtil().setHorizontalSpacing(4),
                              Transform.rotate(
                                  angle: 1.6,
                                  child: SvgPicture.asset(
                                    AppIcons.wifi,
                                    height: 28.h,
                                    width: 28.h,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.white, BlendMode.srcIn),
                                  ))
                            ],
                          ),
                          ScreenUtil().setVerticalSpacing(4),
                          Text(
                            '2564  ****  ****  1121',
                            style: AppTextStyles.labelStyle2.copyWith(
                                color: AppColors.white,
                                fontFamily: AppTextStyles.satoshiBold),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card name',
                                style: AppTextStyles.labelStyle7.copyWith(
                                    color: AppColors.white,
                                    fontFamily: AppTextStyles.satoshiReg),
                              ),
                              Text(
                                'SQB',
                                style: AppTextStyles.labelStyle6.copyWith(
                                    color: AppColors.white,
                                    fontFamily: AppTextStyles.satoshiBold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expires',
                                style: AppTextStyles.labelStyle7.copyWith(
                                    color: AppColors.white,
                                    fontFamily: AppTextStyles.satoshiReg),
                              ),
                              Text(
                                '01/27',
                                style: AppTextStyles.labelStyle6.copyWith(
                                    color: AppColors.white,
                                    fontFamily: AppTextStyles.satoshiBold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
