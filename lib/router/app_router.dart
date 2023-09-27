import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/auth/views/country_residence_view.dart';
import 'package:zumda/features/auth/views/fignerprint_view.dart';
import 'package:zumda/features/auth/views/otp_verify_view.dart';
import 'package:zumda/features/auth/views/passcode_view.dart';
import 'package:zumda/features/auth/views/reasons_view.dart';
import 'package:zumda/features/auth/views/sign_in_view.dart';
import 'package:zumda/features/auth/views/sign_up_view.dart';
import 'package:zumda/features/global/views/global_view.dart';
import 'package:zumda/features/onboarding/views/onboarding_view.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: RoutePaths.onboarding, routes: [
    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RoutePaths.global,
      name: RouteNames.global,
      builder: (context, state) => const GlobalView(),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      name: RouteNames.signIn,
      routes: [
        GoRoute(
          path: RoutePaths.otpVerify,
          name: RouteNames.otpVerify,
          routes: [
            GoRoute(
              path: RoutePaths.fingerPrint,
              name: RouteNames.fingerPrint,
              routes: const [],
              builder: (context, state) => const FingerPrintView(),
            ),
          ],
          builder: (context, state) => const OTPVerifyView(),
        ),
      ],
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      name: RouteNames.signUp,
      routes: [
        GoRoute(
          path: RoutePaths.countryResidence,
          name: RouteNames.countryResidence,
          routes: [
            GoRoute(
              path: RoutePaths.reasons,
              name: RouteNames.reasons,
              routes: [
                GoRoute(
                  path: RoutePaths.passcode,
                  name: RouteNames.passcode,
                  builder: (context, state) => const PasscodeView(),
                )
              ],
              builder: (context, state) => const ReasonsView(),
            )
          ],
          builder: (context, state) => const CountryResidenceView(),
        )
      ],
      builder: (context, state) => const SignUpView(),
    )
  ]);
});

abstract class RouteNames {
  static const onboarding = 'onboarding';
  static const signIn = 'signIn';
  static const signUp = 'signUp';
  static const forgotPassword = 'forgotPassword';
  static const otpVerify = 'otpVerify';
  static const fingerPrint = 'fingerPrint';
  static const countryResidence = 'countryResidence';
  static const reasons = 'reasons';
  static const passcode = 'passcode';
  static const global = 'global';
}

abstract class RoutePaths {
  static const onboarding = '/onboarding';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';
  static const otpVerify = 'otpVerify';
  static const fingerPrint = 'fingerPrint';
  static const countryResidence = 'countryResidence';
  static const reasons = 'reasons';
  static const passcode = 'passcode';
  static const global = '/global';
}
