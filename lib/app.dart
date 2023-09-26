import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/theme/app_colors.dart';

class ZumdaApp extends ConsumerWidget {
  const ZumdaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gorouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
              surfaceTintColor: AppColors.green,
              modalBarrierColor: AppColors.borderColor,
              dragHandleSize: Size(
                40,
                4,
              ),
            ),
            splashFactory: NoSplash.splashFactory,
            scaffoldBackgroundColor: AppColors.backgroundColor),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        routeInformationParser: gorouter.routeInformationParser,
        routeInformationProvider: gorouter.routeInformationProvider,
        routerDelegate: gorouter.routerDelegate,
      ),
    );
  }
}
