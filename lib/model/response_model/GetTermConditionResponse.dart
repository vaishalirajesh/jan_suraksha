import 'package:jan_suraksha/model/response_main_model/TermConitionResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class TermConitionResponse extends TGResponse {
  TermConitionResponseMain _termConitionResponseMain = TermConitionResponseMain();

  TermConitionResponse();

  TermConitionResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _termConitionResponseMain = TermConitionResponseMain.fromJson(json);
  }

  TermConitionResponseMain getTermConition() {
    return _termConitionResponseMain;
  }
}
