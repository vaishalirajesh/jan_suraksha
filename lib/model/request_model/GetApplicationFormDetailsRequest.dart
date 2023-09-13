import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class GetStageDetailRequest extends TGGetRequest {
  GetStageDetailRequest();

  @override
  String getUri() {
    return URIS.URI_APP_FORM_DETAIL;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
