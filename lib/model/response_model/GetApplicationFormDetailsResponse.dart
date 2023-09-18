import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetApplicationFormDetailsResponse extends TGResponse {
  GetApplicationFormDetailsResponseMain _getApplicationFormDetailsResponseMain =
      GetApplicationFormDetailsResponseMain();

  GetApplicationFormDetailsResponse();

  GetApplicationFormDetailsResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getApplicationFormDetailsResponseMain = GetApplicationFormDetailsResponseMain.fromJson(json);
  }

  GetApplicationFormDetailsResponseMain getApplicationFormDetailsResponse() {
    return _getApplicationFormDetailsResponseMain;
  }
}
