import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/auth/components/textbutton_widget.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/shared/textfiel_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const AppBarWidget(),
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
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Create ',
                                style: AppTextStyles.labelStyle2,
                              ),
                              TextSpan(
                                text: 'Zumda',
                                style: AppTextStyles.labelStyle2
                                    .copyWith(color: AppColors.green),
                              ),
                              TextSpan(
                                text: ' account',
                                style: AppTextStyles.labelStyle2,
                              )
                            ]),
                          ),
                          ScreenUtil().setVerticalSpacing(8),
                          Text(
                            'Control your all payments in one app',
                            style: AppTextStyles.labelStyle5,
                          ),
                        ],
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(32),
                    const TextfieldWidget(
                      hintext: 'Fullname',
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const TextfieldWidget(
                      hintext: 'Email',
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const TextfieldWidget(
                      obsecure: true,
                      hintext: 'Password',
                      isPasswordField: true,
                    ),
                    ScreenUtil().setVerticalSpacing(24),
                    FilledAppButton(
                        buttonName: 'Sign Up',
                        onTap: () {
                          context.goNamed(RouteNames.countryResidence);
                        }),
                    ScreenUtil().setVerticalSpacing(24),
                    const Spacer(),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: AppTextStyles.labelStyle6,
                          ),
                          TextButtonWidget(
                            onTap: () {
                              context.goNamed(RouteNames.signIn);
                            },
                            buttonName: 'Sign In',
                            paddingW: 4,
                          )
                        ],
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(50)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
