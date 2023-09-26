import 'package:country/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class CountryResidenceView extends StatelessWidget {
  const CountryResidenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isHasBack: true,
        onTapBack: () {
          context.pop();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenUtil().setVerticalSpacing(24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country of residence',
                          style: AppTextStyles.labelStyle2,
                        ),
                        ScreenUtil().setVerticalSpacing(8),
                        Text(
                          'Please select your country from all coutries',
                          style: AppTextStyles.labelStyle5,
                        ),
                      ],
                    ),
                  ),
                  ScreenUtil().setVerticalSpacing(32),
                  Container(
                    height: 44.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white),
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      enableFeedback: false,
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            showDragHandle: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24.r),
                                    topRight: Radius.circular(24.r))),
                            useSafeArea: true,
                            backgroundColor: AppColors.backgroundColor,
                            context: context,
                            builder: (context) => const CountryBottomSheet());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Select your country',
                            style: AppTextStyles.labelStyle5.copyWith(
                              fontSize: 14.sp,
                              fontFamily: AppTextStyles.satoshiBold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: AppColors.black,
                            size: 18.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  FilledAppButton(
                      buttonName: 'Continue',
                      onTap: () {
                        context.goNamed(RouteNames.reasons);
                      }),
                  ScreenUtil().setVerticalSpacing(50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CountryBottomSheet extends StatelessWidget {
  const CountryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.93,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Center(
            child: Text(
              'Select your country',
              style: AppTextStyles.labelStyle4
                  .copyWith(fontFamily: AppTextStyles.satoshiMed),
            ),
          ),
          ScreenUtil().setVerticalSpacing(8),
          Flexible(
            child: Scrollbar(
              controller: scrollController,
              thickness: 2.w,
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: Countries.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    onTap: () {},
                    leading: Text(
                      Countries.values[index].flagEmoji,
                      style: const TextStyle(fontSize: 28),
                    ),
                    title: Text(
                      "${Countries.values[index].alpha2}  ${Countries.values[index].isoShortName}",
                      style: AppTextStyles.labelStyle6,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
