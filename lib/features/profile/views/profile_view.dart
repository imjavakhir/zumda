import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/features/profile/components/profile_menu_tile.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class ProfileVivew extends StatelessWidget {
  const ProfileVivew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScreenUtil().setVerticalSpacing(24),
            Center(
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: AppColors.cardShadow,
              ),
            ),
            ScreenUtil().setVerticalSpacing(16),
            Text(
              'Tommy Jason',
              style: AppTextStyles.labelStyle3,
            ),
            Text(
              'tommyjason@gmail.com',
              style: AppTextStyles.labelStyle6,
            ),
            ScreenUtil().setVerticalSpacing(24),
            ProfileMenuTile(
                onTap: () {},
                title: 'Account Info',
                leadingPath: AppIcons.userMenu),
            ProfileMenuTile(
                onTap: () {},
                title: 'General Settings',
                leadingPath: AppIcons.settingMenu),
            ProfileMenuTile(
                onTap: () {},
                title: 'Privacy',
                leadingPath: AppIcons.securityMenu),
            ProfileMenuTile(
                onTap: () {},
                title: 'Language',
                leadingPath: AppIcons.languageMenu),
          ],
        ),
      ),
    );
  }
}
