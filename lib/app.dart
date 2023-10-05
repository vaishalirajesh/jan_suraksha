import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_view.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_view.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_view.dart';
import 'package:jan_suraksha/view/screen/splash/splash_screen_binding.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:permission_handler/permission_handler.dart';

import 'config/color_config.dart';
import 'config/style_config.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  RxBool isConnected = true.obs;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent, systemNavigationBarIconBrightness: Brightness.light));
    requestWriteStoragePermission();

    final StreamSubscription<InternetConnectionStatus> listener = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnected.value = true;
            break;
          case InternetConnectionStatus.disconnected:
            isConnected.value = false;
            break;
        }
        setState(() {});
      },
    );
    super.initState();
  }

  Future<void> requestWriteStoragePermission() async {
    // Check if permission is already granted.
    var status = await Permission.storage.status;
    // Request permission.
    status = await Permission.storage.request();
    if (status.isGranted) {
      TGSharedPreferences.getInstance().set(PREF_STORAGE_ENABLED, false);
    } else {
      TGSharedPreferences.getInstance().set(PREF_STORAGE_ENABLED, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return isConnected.value
            ? GetMaterialApp(
                debugShowCheckedModeBanner: false,
                useInheritedMediaQuery: true,
                getPages: NavigationConfig.getPages(),
                initialBinding: SplashScreenBinding(),
                initialRoute: NavigationConfig.initialRoute.name,
              )
            : Material(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You are not connected to the internet.",
                              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextGreyColor),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: AppButton(
                                  onPress: () async {
                                    bool isOpened = await openAppSettings();
                                  },
                                  title: "Open Settings",
                                  isButtonEnable: true.obs,
                                  isDataLoading: false.obs),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == ServicesPageRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => ServicesPage(),
        binding: ServicesTabBinding(),
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
