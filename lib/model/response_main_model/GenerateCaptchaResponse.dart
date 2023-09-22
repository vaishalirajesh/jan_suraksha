import '../../services/response/tg_response.dart';
import '../response_model/GenerateCaptcha.dart';

class GenerateCaptchaResponse extends TGResponse {
  GenerateCaptcha _generateCaptchaResponse = GenerateCaptcha();

  GenerateCaptchaResponse();

  GenerateCaptchaResponse.fromJson(dynamic json) {
    print(json);
    fromJson(json);
  }

  @override
  fromJson(json) {
    _generateCaptchaResponse = GenerateCaptcha.fromJson(json);
  }

  GenerateCaptcha verifyOTP() {
    return _generateCaptchaResponse;
  }
}
