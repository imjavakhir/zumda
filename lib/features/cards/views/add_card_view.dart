import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/cards/components/card_color_component.dart';
import 'package:zumda/features/home/components/credit_card.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/shared/textfiel_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Add card',
          isHasBack: true,
          onTapBack: () {
            context.pop();
          },
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CreditCardComponent(
                      index: 0,
                      firstColor: cardColors[selected].firstColor,
                      secondColor: cardColors[selected].secondColor,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      alignment: Alignment.center,
                      height: 40.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cardColors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardColorComponent(
                            firstColor: cardColors[index].firstColor,
                            secondColor: cardColors[index].secondColor,
                            index: index,
                            valueChanged: (value) {
                              selected = value;
                              setState(() {});
                            },
                            isSelected: selected == index,
                          );
                        },
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Card details',
                        style: AppTextStyles.labelStyle4
                            .copyWith(fontFamily: AppTextStyles.satoshiMed),
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const TextfieldWidget(hintext: 'Card number'),
                    ScreenUtil().setVerticalSpacing(16),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: TextfieldWidget(hintext: 'Expiry date')),
                        Expanded(child: TextfieldWidget(hintext: 'CVV'))
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    const TextfieldWidget(hintext: 'Card name'),
                    const Spacer(),
                    ScreenUtil().setVerticalSpacing(24),
                    FilledAppButton(buttonName: 'Save card', onTap: () {}),
                    ScreenUtil().setVerticalSpacing(50)
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CardColorModel {
  final Color firstColor;
  final Color secondColor;

  CardColorModel({required this.firstColor, required this.secondColor});
}

List<CardColorModel> cardColors = [
  CardColorModel(
      firstColor: AppColors.green, secondColor: AppColors.primaryColor),
  CardColorModel(firstColor: AppColors.grey, secondColor: AppColors.black),
  CardColorModel(
      firstColor: AppColors.primaryColor, secondColor: AppColors.black),
  CardColorModel(firstColor: AppColors.green, secondColor: AppColors.black),
  CardColorModel(
      firstColor: AppColors.grey, secondColor: AppColors.primaryColor),
  CardColorModel(firstColor: AppColors.grey, secondColor: AppColors.green)
];
