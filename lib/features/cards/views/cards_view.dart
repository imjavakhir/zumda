import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/home/components/credit_card.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Cards',
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return CreditCardComponent(
            index: index,
            paddingH: 4,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          highlightElevation: 0,
          elevation: 4,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            context.goNamed(RouteNames.addCard);
          },
          label: Row(
            children: [
              SvgPicture.asset(
                AppIcons.cardAdd,
                height: 24.h,
                width: 24.h,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              ScreenUtil().setHorizontalSpacing(8),
              Text(
                'Add card',
                style: AppTextStyles.labelStyle7.copyWith(
                    color: AppColors.white,
                    fontFamily: AppTextStyles.satoshiBold),
              )
            ],
          )),
    );
  }
}
