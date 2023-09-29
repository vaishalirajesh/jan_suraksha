import '../../services/request/tg_get_request.dart';
import '../../services/uris.dart';

class LogOutRequest extends TGGetRequest {
  LogOutRequest({required this.id, required this.type});

  String type;
  String id;

  @override
  String getUri() {
    return URIS.URI_LOG_OUT;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
