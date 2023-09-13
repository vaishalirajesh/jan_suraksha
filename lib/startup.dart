import 'package:jan_suraksha/services/common/app_constants.dart';
import 'package:jan_suraksha/services/common/app_init.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/utils/flavor.dart';

abstract class Startup {
  static void init() async {
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
    await Future.delayed(const Duration(seconds: 5));
  }
}
