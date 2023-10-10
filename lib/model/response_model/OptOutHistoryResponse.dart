import 'package:jan_suraksha/model/response_main_model/OptOutHistoryResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class OptOutHistoryResponse extends TGResponse {
  OptOutHistoryResponseMain _optOutHistoryResponseMain = OptOutHistoryResponseMain();

  OptOutHistoryResponse();

  OptOutHistoryResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _optOutHistoryResponseMain = OptOutHistoryResponseMain.fromJson(json);
  }

  OptOutHistoryResponseMain getOptOutHistory() {
    return _optOutHistoryResponseMain;
  }
}
