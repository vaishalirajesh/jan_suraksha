import 'package:jan_suraksha/model/response_main_model/PreminumDeductionResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class PremiumDeductionResponse extends TGResponse {
  PremiumDeductionResponseMain _premiumDeductionResponseMain = PremiumDeductionResponseMain();

  PremiumDeductionResponse();

  PremiumDeductionResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _premiumDeductionResponseMain = PremiumDeductionResponseMain.fromJson(json);
  }

  PremiumDeductionResponseMain PremiumDeduction() {
    return _premiumDeductionResponseMain;
  }
}
