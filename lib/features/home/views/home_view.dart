import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/features/auth/components/textbutton_widget.dart';
import 'package:zumda/features/home/components/credit_card.dart';
import 'package:zumda/features/home/components/home_menu_item.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Zumda',
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
            height: 224.h,
            decoration: const BoxDecoration(boxShadow: []),
            width: double.maxFinite,
            child: PageView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => CreditCardComponent(
                index: index,
              ),
            ),
          ),
          ScreenUtil().setVerticalSpacing(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 80.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  menuItemsInfoList.length,
                  (index) => HomeMenuItem(
                        title: menuItemsInfoList.keys.elementAt(index),
                        iconPath: menuItemsInfoList.values.elementAt(index),
                      )),
            ),
          ),
          ScreenUtil().setVerticalSpacing(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Today, Oct 13',
                  style: AppTextStyles.labelStyle6
                      .copyWith(fontFamily: AppTextStyles.satoshiBold),
                ),
                const Spacer(),
                TextButtonWidget(
                  onTap: () {},
                  buttonName: 'All transactions',
                  paddingW: 0,
                ),
                ScreenUtil().setVerticalSpacing(16),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.h)),
                  leading: Container(
                    alignment: Alignment.center,
                    height: 48.h,
                    width: 48.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: SvgPicture.asset(
                      AppIcons.moneyReceive,
                      height: 24.h,
                      width: 24.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                  trailing: Text(
                    '+\$2890',
                    style: AppTextStyles.labelStyle6.copyWith(
                        fontFamily: AppTextStyles.satoshiBold,
                        color: AppColors.green),
                  ),
                  title: Text(
                    'Bank of America',
                    style: AppTextStyles.labelStyle6
                        .copyWith(fontFamily: AppTextStyles.satoshiMed),
                  ),
                  subtitle: Text(
                    'Deposit',
                    style: AppTextStyles.labelStyle7
                        .copyWith(fontFamily: AppTextStyles.satoshiReg),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, dynamic> menuItemsInfoList = {
  'Deposit': AppIcons.moneyReceive,
  'Transfers': AppIcons.transfer,
  'Withdraw': AppIcons.moneySend,
  'More': AppIcons.elementAdd
};
