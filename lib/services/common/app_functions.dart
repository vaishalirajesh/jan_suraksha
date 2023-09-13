import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/flavor.dart';
import 'package:jan_suraksha/utils/utils.dart';

import '../request/tg_request.dart';
import 'app_constants.dart';

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['Cache-Control'] = 'no-store, no-cache, must-revalidate';

  // headers['locale'] = TGLocale.currentLocale.toString();
  return headers;
}

void setAccessTokenInRequestHeader() async {
  String? accesstoken = await AppUtils.getAccessToken();
  if (accesstoken != null && accesstoken.isEmpty == false) {
    TGRequest.defaultHeaders!['token'] = accesstoken;
  } else {
    TGRequest.defaultHeaders!.remove('token');
  }
}

void saveKeyValue(String key, dynamic value) {
  TGSession.getInstance().set(key, value);
  TGSharedPreferences.getInstance().set(key, value);
}

void removeKey(String key) {
  TGSharedPreferences.getInstance().remove(key);
  TGSession.getInstance().remove(key);
}

bool isProd() {
  return AppFlavor.name() == FLAVOR_PROD;
}
