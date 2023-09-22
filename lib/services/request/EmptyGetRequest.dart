import 'package:jan_suraksha/services/request/tg_get_request.dart';

import '../uris.dart';

class EmptyTgGetRequest extends TGGetRequest {
  @override
  String getUri() {
    return URIS.URI_GEN_CAPTCH;
  }

  @override
  Map<String, dynamic> params() {
    return {};
  }
}
