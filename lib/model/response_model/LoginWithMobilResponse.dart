import 'package:jan_suraksha/model/response_main_model/LoginWithMobilResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class LoginWithMobilResponse extends TGResponse {
  LoginWithMobilResponseMain _loginWithMobilResponseMain = LoginWithMobilResponseMain();

  LoginWithMobilResponse();

  LoginWithMobilResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _loginWithMobilResponseMain = LoginWithMobilResponseMain.fromJson(json);
  }

  LoginWithMobilResponseMain getLoginResponse() {
    return _loginWithMobilResponseMain;
  }
}
