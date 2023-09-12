import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class GetAllMenuForBankerRequest extends TGGetRequest {
  GetAllMenuForBankerRequest();

  @override
  String getUri() {
    return URIS.URI_GET_ALL_MENU_BANKER;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
