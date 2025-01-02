import 'package:get/get.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/history_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: RouteNames.splash, page: () => const SplashScreen()),
    GetPage(
        name: RouteNames.login,
        page: () => LoginScreen()), // Perbaiki nama class
    GetPage(name: RouteNames.register, page: () => RegisterScreen()),
    GetPage(name: RouteNames.home, page: () => HomeScreen()),
    GetPage(name: RouteNames.profile, page: () => ProfileScreen()),
    GetPage(name: RouteNames.settings, page: () => const SettingsScreen()),
    GetPage(name: RouteNames.history, page: () => const HistoryScreen()),
  ];
}
