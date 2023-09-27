import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class TermConditionRequest extends TGGetRequest {
  TermConditionRequest({required this.id});

  String id;

  @override
  String getUri() {
    return "${URIS.URI_GET_TERM_CONDITION}/$id";
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
