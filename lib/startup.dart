import 'package:jan_suraksha/services/common/app_constants.dart';
import 'package:jan_suraksha/services/common/app_init.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/utils/flavor.dart';

class Startup {
  static bool initialized = false;

  static void init() async {
    initialized = true;
    await _initFlavor();
    await _init();
  }

  static Future<void> _init() async {
    TGLog.d("Initialize init");
    await initService();

    TGLog.d("Initialize init end");
  }

  static Future<void> _initFlavor() async {
    TGLog.d("Initialize flavor");
    AppFlavor.init(CONFIG_FLAVORS_FILE);
    await Future.delayed(const Duration(seconds: 2));
  }
}
