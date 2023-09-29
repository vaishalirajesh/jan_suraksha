import '../../services/request/tg_get_request.dart';
import '../../services/uris.dart';

class GetTokenForSkipRequest extends TGGetRequest {
  GetTokenForSkipRequest();

  @override
  String getUri() {
    return URIS.URI_SKIP_EMAIL;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}

class UpdateSelectedAccountHolderRequest {
  UpdateSelectedAccountHolderRequest();
}
