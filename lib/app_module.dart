import 'package:food_cafe/ui/page/new_order_page.dart';
import 'package:get/route_manager.dart';
import 'binding/home_binding.dart';
import 'binding/login_binding.dart';
import 'binding/new_order_binding.dart';
import 'binding/past_order_binding.dart';
import 'binding/splash_binding.dart';
import 'resource/routes.dart';
import 'ui/page/home_page.dart';
import 'ui/page/login_page.dart';
import 'ui/page/past_order_page.dart';
import 'ui/page/splash_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: firstLaunchRoute,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(name: homeRoute, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: pastOrderRoute,
        page: () => PastOrderPage(),
        binding: PastOrderBinding()),
    GetPage(
        name: newOrderRoute,
        page: () => NewOrderPage(),
        binding: NewOrderBinding()),
    GetPage(name: loginRoute, page: () => LoginPage(), binding: LoginBinding()),
  ];
}
