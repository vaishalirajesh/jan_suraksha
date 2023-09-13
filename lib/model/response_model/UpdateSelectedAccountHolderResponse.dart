import 'package:jan_suraksha/model/response_main_model/UpdateSelectedAccountHolderResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class UpdateSelectedAccountHolderResponse extends TGResponse {
  UpdateSelectedAccountHolderResponseMain _updateSelectedAccountHolderResponseMain =
      UpdateSelectedAccountHolderResponseMain();

  UpdateSelectedAccountHolderResponse();

  UpdateSelectedAccountHolderResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _updateSelectedAccountHolderResponseMain = UpdateSelectedAccountHolderResponseMain.fromJson(json);
  }

  UpdateSelectedAccountHolderResponseMain updateSelectedAccountHolder() {
    return _updateSelectedAccountHolderResponseMain;
  }
}
