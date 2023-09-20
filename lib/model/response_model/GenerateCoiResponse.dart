import 'package:jan_suraksha/model/response_main_model/GenerateCoiResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GenerateCoiResponse extends TGResponse {
  GenerateCoiResponseMain _generateCoiResponseMain = GenerateCoiResponseMain();

  GenerateCoiResponse();

  GenerateCoiResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _generateCoiResponseMain = GenerateCoiResponseMain.fromJson(json);
  }

  GenerateCoiResponseMain generateCoi() {
    return _generateCoiResponseMain;
  }
}
