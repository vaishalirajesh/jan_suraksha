import 'package:jan_suraksha/services/response/tg_response.dart';

import '../response_main_model/ForgotPasswordResponseMain.dart';

class ForgotPasswordResponse extends TGResponse {
  ForgotPasswordResponseMain _forgotPasswordResponseMain = ForgotPasswordResponseMain();

  ForgotPasswordResponse();

  ForgotPasswordResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _forgotPasswordResponseMain = ForgotPasswordResponseMain.fromJson(json);
  }

  ForgotPasswordResponseMain forgotPassword() {
    return _forgotPasswordResponseMain;
  }
}
