import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jan_suraksha/services/common/tg_log.dart';

import 'hasnetwork.dart';

/// TGFramework's Network related implementation
class NetUtils {
  /// Check site - going with google as standard
  static const _CHECK_SITE = "google.com";

  /// Checks if internet is available or not with default check site
  static Future<bool> isInternetAvailable() async {
    if (kIsWeb) {
      return hasNetwork();
    } else {
      return isReachable(_CHECK_SITE);
    }
  }

  /// Checks if given site is reachable
  static Future<bool> isReachable(String site) async {
    bool isAvailable = false;
    try {
      final result = await InternetAddress.lookup(site);
      isAvailable = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isAvailable = false;
    }
    TGLog.d("TGNetUtil.isReachable('" + site + "') = " + isAvailable.toString());
    return isAvailable;
  }

  /// Checks internet and api health
  static Future<bool> apiHealthCheck(String site, {int timeout = 5}) async {
    try {
      if (site.indexOf("?") > -1)
        site = site + "&";
      else
        site = site + "?";

      site = site + "t=" + DateTime.now().millisecondsSinceEpoch.toString();
      http.Response response = await http.get(Uri.parse(site)).timeout(
        Duration(seconds: timeout),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch (error) {
      return false;
    }
  }
}
