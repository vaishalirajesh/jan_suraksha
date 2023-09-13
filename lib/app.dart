import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_view.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_view.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_view.dart';
import 'package:jan_suraksha/view/screen/splash/splash_screen_binding.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        getPages: NavigationConfig.getPages(),
        initialBinding: SplashScreenBinding(),
        initialRoute: NavigationConfig.initialRoute.name,
      ),
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == ServicesPageRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => ServicesPage(),
        binding: ServicesBinding(),
      );
    }

    if (settings.name == SupportPageRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => SupportPage(),
        binding: SupportBinding(),
      );
    }

    if (settings.name == ProfilePageRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfilePage(),
        binding: ProfileBinding(),
      );
    }

    if (settings.name == DashboardPageRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => DashboardPage(),
        binding: DashboardBinding(),
      );
    }
    return null;
  }
}
