import 'package:jan_suraksha/model/response_main_model/LoginResponseMainModel.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class LoginResponse extends TGResponse {
  LoginResponseMainModel _loginResponseMainModel = LoginResponseMainModel();

  LoginResponse();

  LoginResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _loginResponseMainModel = LoginResponseMainModel.fromJson(json);
  }

  LoginResponseMainModel getLoginResponseData() {
    return _loginResponseMainModel;
  }
}
