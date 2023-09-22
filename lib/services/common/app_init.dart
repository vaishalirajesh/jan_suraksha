import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/services_manager.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/flavor.dart';

import 'app_functions.dart';
import 'keys.dart';

initTheme(BuildContext context) async {
  bool? flagDarkTheme = await TGSharedPreferences.getInstance().get(KEY_FLAG_DARK_THEME);
  if (flagDarkTheme == null) {
    flagDarkTheme = true;
    TGSharedPreferences.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);
  }
  TGSession.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);

  String? textSize = await TGSharedPreferences.getInstance().get(KEY_TEXT_SIZE);
  if (textSize == null) {
    textSize = "R";
    TGSharedPreferences.getInstance().set(KEY_TEXT_SIZE, textSize);
  }
  TGSession.getInstance().set(KEY_TEXT_SIZE, textSize);
}

Future<void> initService() async {
  TGLog.d("initService()");
  await TGService.init(baseUrl: AppFlavor.baseUrl(), applyMock: AppFlavor.applyMock(), mockMappingsFile: AppFlavor.mockMappingsFile(), headers: defaultHeaders(), badCertificateCallbackEnabled: false);
  setAccessTokenInRequestHeader();
}

Future<void> initAppVersionInfo() async {
  TGLog.d("initAppVersionInfo()");
  String? projectVersion;
  try {
    // projectVersion = await GetVersion.projectVersion;
  } on PlatformException {
    TGLog.e('Failed to get project version.');
  }
  String version = (projectVersion != null) ? "v" + projectVersion : "";
  TGSession.getInstance().set(KEY_APP_VERSION, version);
}
