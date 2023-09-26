import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class ReasonsView extends StatefulWidget {
  const ReasonsView({super.key});

  @override
  State<ReasonsView> createState() => _ReasonsViewState();
}

class _ReasonsViewState extends State<ReasonsView> {
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
                          'Main reason for using smartpay',
                          style: AppTextStyles.labelStyle2,
                        ),
                        ScreenUtil().setVerticalSpacing(8),
                        Text(
                          'We need to know this for regulatory reasons. And also we\'re curious!',
                          style: AppTextStyles.labelStyle5,
                        ),
                      ],
                    ),
                  ),
                  ScreenUtil().setVerticalSpacing(32),
                  SizedBox(
                    height: constraints.maxHeight * .6,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        crossAxisCount: 2,
                      ),
                      itemCount: reasonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                              color: reasonList[index].isSelected
                                  ? AppColors.green
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            onPressed: () {
                              setState(() {
                                reasonList[index].isSelected =
                                    !reasonList[index].isSelected;
                              });
                            },
                            enableFeedback: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  reasonList[index].reasonIcon,
                                  size: 28.r,
                                  color: reasonList[index].isSelected
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                const Spacer(),
                                Text(
                                  reasonList[index].reasontitle,
                                  style: AppTextStyles.labelStyle5.copyWith(
                                    fontFamily: AppTextStyles.satoshiMed,
                                    color: reasonList[index].isSelected
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  FilledAppButton(
                      isDisabled:
                          !reasonList.any((element) => element.isSelected),
                      buttonName: 'Continue',
                      onTap: () {
                        context.goNamed(RouteNames.passcode);
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

List<ReasonModel> reasonList = [
  ReasonModel(
      reasontitle: "Spend or save daily",
      reasonIcon: CupertinoIcons.arrow_2_squarepath),
  ReasonModel(
    reasontitle: "Fast my transactions",
    reasonIcon: CupertinoIcons.bolt,
  ),
  ReasonModel(
    reasontitle: "Payments to friends",
    reasonIcon: CupertinoIcons.person_2,
  ),
  ReasonModel(
    reasontitle: "Online payments",
    reasonIcon: CupertinoIcons.creditcard,
  ),
  ReasonModel(
      reasontitle: "Spend while travelling",
      reasonIcon: CupertinoIcons.tickets),
  ReasonModel(
      reasontitle: "Your financial assets",
      reasonIcon: CupertinoIcons.rectangle_paperclip),
];

class ReasonModel {
  final String reasontitle;
  final IconData reasonIcon;
  bool isSelected;

  ReasonModel(
      {required this.reasontitle,
      required this.reasonIcon,
      this.isSelected = false});
}
