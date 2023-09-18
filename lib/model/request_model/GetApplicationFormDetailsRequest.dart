import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class GetApplicationFormDetailsRequest extends TGGetRequest {
  GetApplicationFormDetailsRequest({required this.appId});
  String appId;

  @override
  String getUri() {
    return '${URIS.URI_APP_FORM_DETAIL}/$appId';
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
