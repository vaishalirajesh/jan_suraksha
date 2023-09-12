import 'package:jan_suraksha/model/response_main_model/GetAllMenuForBankerResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetAllMenuForBankerResponse extends TGResponse {
  GetAllMenuForBankerResponseMain _getAllMenuForBankerResponseMain = GetAllMenuForBankerResponseMain();

  GetAllMenuForBankerResponse();

  GetAllMenuForBankerResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getAllMenuForBankerResponseMain = GetAllMenuForBankerResponseMain.fromJson(json);
  }

  GetAllMenuForBankerResponseMain getAllMenuForBanker() {
    return _getAllMenuForBankerResponseMain;
  }
}
