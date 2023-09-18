import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
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
  String loginToken = await TGSharedPreferences.getInstance().get(PREF_LOGIN_TOKEN) ?? '';
  String refreshToken = await TGSharedPreferences.getInstance().get(PREF_REFRESHTOKEN) ?? '';
  String userName = await TGSharedPreferences.getInstance().get(PREF_LOGIN_USERNAME) ?? '';
  if (accesstoken != null &&
      accesstoken.isEmpty == false &&
      loginToken.isNotEmpty &&
      refreshToken.isNotEmpty &&
      userName.isNotEmpty) {
    TGRequest.defaultHeaders!['tk_ac'] = accesstoken;
    TGRequest.defaultHeaders!['tk_rc'] = refreshToken;
    TGRequest.defaultHeaders!['tk_lg'] = loginToken;
    TGRequest.defaultHeaders!['ur_cu'] = userName;
  } else {
    TGRequest.defaultHeaders!.remove('tk_ac');
    TGRequest.defaultHeaders!.remove('tk_rc');
    TGRequest.defaultHeaders!.remove('tk_lg');
    TGRequest.defaultHeaders!.remove('ur_cu');
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
