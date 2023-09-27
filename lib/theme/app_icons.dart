abstract class AppIcons {
  static const String card = 'assets/icons/card.svg';
  static const String scan = 'assets/icons/scan.svg';
  static const String activity = 'assets/icons/activity.svg';
  static const String user = 'assets/icons/user.svg';
  static const String home = 'assets/icons/home.svg';
  static const String cards = 'assets/icons/cards.svg';
  static const String arrowBack = 'assets/icons/arrow_back.svg';
  static const String arrowForward = 'assets/icons/arrow_forward.svg';
  static const String userMenu = 'assets/icons/user_menu.svg';
  static const String settingMenu = 'assets/icons/settings_menu.svg';
  static const String languageMenu = 'assets/icons/language_menu.svg';
  static const String securityMenu = 'assets/icons/security_menu.svg';
  static const String lockMenu = 'assets/icons/lock_menu.svg';
  static const String fingerMenu = 'assets/icons/finger_menu.svg';
  static const String notification = 'assets/icons/notification.svg';
  static const String wifi = 'assets/icons/wifi.svg';

  static const Map<String, dynamic> bottomNavigationItems = {
    'Home': {'inactive': home, 'active': home},
    'Cards': {'inactive': cards, 'active': cards},
    // 'Scan': {'inactive': scan, 'active': scan},
    'Activity': {'inactive': activity, 'active': activity},
    'Profile': {'inactive': user, 'active': user}
  };
}
