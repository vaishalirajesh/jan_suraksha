import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';

import 'constant/prefrenceconstants.dart';

void handleServiceFailError(BuildContext context, TGResponse? serviceError, {String? msg}) {
  if (msg != null) {
    showSnackBar(Get.context!, msg);
  } else {
    if (serviceError != null) {
      if (serviceError.httpStatus == 401) {
        TGSharedPreferences.getInstance().remove(PREF_GSTIN);
        TGSharedPreferences.getInstance().remove(PREF_LOGIN_RES);
        TGSharedPreferences.getInstance().remove(PREF_REFRESHTOKEN);
        TGSharedPreferences.getInstance().remove(PREF_LOGIN_TOKEN);
        TGSharedPreferences.getInstance().remove(PREF_LOGIN_USERNAME);
        TGSharedPreferences.getInstance().remove(PREF_MOBILE);
        TGSharedPreferences.getInstance().remove(PREF_PANNO);
        TGSharedPreferences.getInstance().remove(PREF_BUSINESSNAME);
        TGSharedPreferences.getInstance().remove(PREF_USERNAME);
        TGSharedPreferences.getInstance().remove(PREF_USERSTATE);
        TGSharedPreferences.getInstance().remove(PREF_AAID);
        TGSharedPreferences.getInstance().remove(PREF_AACODE);
        TGSharedPreferences.getInstance().remove(PREF_LOANAPPREFID);
        TGSharedPreferences.getInstance().remove(PREF_LOANOFFER);
        TGSharedPreferences.getInstance().remove(PREF_AAURL);
        TGSharedPreferences.getInstance().remove(PREF_AACALLBACKURL);
        TGSharedPreferences.getInstance().remove(PREF_CONSENTTYPE);
        TGSharedPreferences.getInstance().remove(PREF_CONSENT_AAID);
        TGSharedPreferences.getInstance().remove(PREF_OFFERID);
        TGSharedPreferences.getInstance().remove(PREF_LOANAPPID);
        TGSharedPreferences.getInstance().remove(PREF_REPAYMENTPLANID);
        TGSharedPreferences.getInstance().remove(PREF_CURRENT_STAGE);
        TGSharedPreferences.getInstance().remove(PREF_ISTC_DONE);
        TGSharedPreferences.getInstance().remove(PREF_ISGST_CONSENT);
        TGSharedPreferences.getInstance().remove(PREF_ISGSTDETAILDONE);
        TGSharedPreferences.getInstance().remove(PREF_ISCIC_CONSENT);
        TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
        TGSharedPreferences.getInstance().remove(PREF_ENABLE_POPUP);
        TGSharedPreferences.getInstance().remove(PREF_APP_ID);
        TGSharedPreferences.getInstance().remove(PREF_ORG_ID);
        TGSharedPreferences.getInstance().remove(PREF_SCHEME_ID);
        TGSharedPreferences.getInstance().remove(PREF_USER_ID);
        TGSharedPreferences.getInstance().remove(PREF_ACCOUNT_HOLDER_DATA);
        TGSharedPreferences.getInstance().remove(PREF_USER_FORM_DATA);
        TGSession.getInstance().set(PREF_USER_FORM_DATA, "");
        TGSharedPreferences.getInstance().remove(PREF_IS_FROM_REG);
        TGSharedPreferences.getInstance().remove(PREF_IS_ADULT);
        TGSharedPreferences.getInstance().remove(PREF_USER_NAME);
        TGSharedPreferences.getInstance().remove(PREF_USER_EMAIL);
        Get.offAll(() => LoginPage(), binding: LoginBinding());
      } else if (serviceError.error == 500) {
      } else {
        showSnackBar(context, serviceError.error ?? "Error");
      }
    }
  }
}
