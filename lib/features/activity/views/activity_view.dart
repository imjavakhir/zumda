import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/features/auth/components/textbutton_widget.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Activity',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenUtil().setVerticalSpacing(12),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total spending',
                    style: AppTextStyles.labelStyle5
                        .copyWith(fontFamily: AppTextStyles.satoshiMed),
                  ),
                  ScreenUtil().setVerticalSpacing(8),
                  Text(
                    '\$17500.80',
                    style: AppTextStyles.labelStyle3.copyWith(
                        fontFamily: AppTextStyles.satoshiBold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            ScreenUtil().setVerticalSpacing(16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.maxFinite,
              height: 200.h,
              child: BarChart(
                BarChartData(
                  extraLinesData: const ExtraLinesData(
                      extraLinesOnTop: false, horizontalLines: []),
                  barTouchData: barTouchData,
                  titlesData: titlesData,
                  borderData: borderData,
                  barGroups: barGroups,
                  gridData:
                      const FlGridData(show: true, drawVerticalLine: false),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 15,
                ),
              ),
            ),
            ScreenUtil().setVerticalSpacing(24),
            const IncomeExpenseComponent(),
            ScreenUtil().setVerticalSpacing(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Incomes',
                    style: AppTextStyles.labelStyle6
                        .copyWith(fontFamily: AppTextStyles.satoshiBold),
                  ),
                  const Spacer(),
                  TextButtonWidget(
                    onTap: () {},
                    buttonName: 'All Incomes',
                    paddingW: 0,
                  ),
                  ScreenUtil().setVerticalSpacing(16),
                ],
              ),
            ),
            SizedBox(
              height: 128.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                separatorBuilder: (context, index) =>
                    ScreenUtil().setHorizontalSpacing(20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    height: 120.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(CupertinoIcons.rectangle_stack_badge_plus),
                        const Spacer(),
                        Text(
                          'Investments',
                          style: AppTextStyles.labelStyle6
                              .copyWith(color: AppColors.grey),
                        ),
                        ScreenUtil().setVerticalSpacing(4),
                        Text(
                          '\$585.20',
                          style: AppTextStyles.labelStyle5.copyWith(
                              color: AppColors.green,
                              fontFamily: AppTextStyles.satoshiBold),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            ScreenUtil().setVerticalSpacing(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Expenses',
                    style: AppTextStyles.labelStyle6
                        .copyWith(fontFamily: AppTextStyles.satoshiBold),
                  ),
                  const Spacer(),
                  TextButtonWidget(
                    onTap: () {},
                    buttonName: 'All Expenses',
                    paddingW: 0,
                  ),
                  ScreenUtil().setVerticalSpacing(16),
                ],
              ),
            ),
            SizedBox(
              height: 128.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                separatorBuilder: (context, index) =>
                    ScreenUtil().setHorizontalSpacing(20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    height: 120.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(CupertinoIcons.rectangle_stack_badge_minus),
                        const Spacer(),
                        Text(
                          'Investments',
                          style: AppTextStyles.labelStyle6
                              .copyWith(color: AppColors.grey),
                        ),
                        ScreenUtil().setVerticalSpacing(4),
                        Text(
                          '\$585.20',
                          style: AppTextStyles.labelStyle5.copyWith(
                              color: AppColors.primaryColor,
                              fontFamily: AppTextStyles.satoshiBold),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeExpenseComponent extends StatelessWidget {
  const IncomeExpenseComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                    color: AppColors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16.r)),
              height: 64.h,
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white),
                    child: SvgPicture.asset(
                      AppIcons.moneyReceive,
                      height: 20.h,
                      width: 20.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                  ScreenUtil().setHorizontalSpacing(12),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Income\n',
                      style: AppTextStyles.labelStyle7.copyWith(
                          color: AppColors.grey,
                          fontFamily: AppTextStyles.satoshiReg),
                    ),
                    TextSpan(
                      text: '\$12500.40',
                      style: AppTextStyles.labelStyle6.copyWith(
                          color: AppColors.green,
                          fontFamily: AppTextStyles.satoshiBold),
                    )
                  ]))
                ],
              ),
            ),
          ),
          ScreenUtil().setHorizontalSpacing(16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: AppColors.grey),
                  borderRadius: BorderRadius.circular(16.r)),
              height: 64.h,
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white),
                    child: SvgPicture.asset(
                      AppIcons.moneySend,
                      height: 20.h,
                      width: 20.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                  ScreenUtil().setHorizontalSpacing(12),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Expense\n',
                      style: AppTextStyles.labelStyle7.copyWith(
                          color: AppColors.grey,
                          fontFamily: AppTextStyles.satoshiReg),
                    ),
                    TextSpan(
                      text: '\$7000.40',
                      style: AppTextStyles.labelStyle6.copyWith(
                          color: AppColors.primaryColor,
                          fontFamily: AppTextStyles.satoshiBold),
                    )
                  ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  final style = AppTextStyles.labelStyle6.copyWith(color: AppColors.grey);
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Dec 27';
      break;
    case 1:
      text = 'Dec 28';
      break;
    case 2:
      text = 'Dec 29';
      break;
    case 3:
      text = 'Dec 30';
      break;
    case 4:
      text = 'Dec 31';
      break;

    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) => Text(
            '\$${value.toInt()}K',
            style: AppTextStyles.labelStyle7.copyWith(
                fontFamily: AppTextStyles.satoshiReg, color: AppColors.grey),
          ),
        ),
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 8,
            width: 12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            color: AppColors.green,
          ),
          BarChartRodData(
            toY: 10,
            width: 12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            color: AppColors.primaryColor,
          )
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 12,
            width: 12,
            color: AppColors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          ),
          BarChartRodData(
            toY: 10,
            width: 12,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          )
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 14,
            width: 12,
            color: AppColors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          ),
          BarChartRodData(
            toY: 11,
            width: 12,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            width: 12,
            toY: 15,
            color: AppColors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          ),
          BarChartRodData(
            toY: 12,
            width: 12,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          )
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 13,
            width: 12,
            color: AppColors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          ),
          BarChartRodData(
            toY: 8,
            width: 12,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
          )
        ],
      ),
    ];
