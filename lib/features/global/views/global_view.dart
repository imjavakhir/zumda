import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/features/activity/views/activity_view.dart';
import 'package:zumda/features/cards/views/cards_view.dart';
import 'package:zumda/features/home/views/home_view.dart';
import 'package:zumda/features/profile/views/profile_view.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class GlobalView extends StatefulWidget {
  const GlobalView({super.key});

  @override
  State<GlobalView> createState() => _GlobalViewState();
}

class _GlobalViewState extends State<GlobalView> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _globalPages[select],
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   enableFeedback: false,
        //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   elevation: 0.5,
        //   backgroundColor: AppColors.green,
        //   onPressed: () {},
        //   child: SvgPicture.asset(
        //     AppIcons.scan,
        //     colorFilter: const ColorFilter.mode(
        //       AppColors.white,
        //       BlendMode.srcIn,
        //     ),
        //     height: 24.h,
        //     width: 24.h,
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
            enableFeedback: false,
            currentIndex: select,
            onTap: (value) {
              select = value;
              setState(() {});
            },
            selectedItemColor: AppColors.green,
            unselectedItemColor: AppColors.black,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.backgroundColor,
            selectedLabelStyle: AppTextStyles.labelStyle7
                .copyWith(fontFamily: AppTextStyles.satoshiMed),
            unselectedLabelStyle: AppTextStyles.labelStyle7
                .copyWith(fontFamily: AppTextStyles.satoshiMed),
            items: List.generate(
                AppIcons.bottomNavigationItems.length,
                (index) => BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      AppIcons.bottomNavigationItems.values
                          .elementAt(index)['active'],
                      height: 24.h,
                      width: 24.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.green, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      AppIcons.bottomNavigationItems.values
                          .elementAt(index)['inactive'],
                      height: 24.h,
                      width: 24.h,
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                    ),
                    label: AppIcons.bottomNavigationItems.keys
                        .elementAt(index)))));
  }
}

List<Widget?> _globalPages = [
  const HomeView(),
  const CardsView(),
  const ActivityView(),
  const ProfileVivew()
];
