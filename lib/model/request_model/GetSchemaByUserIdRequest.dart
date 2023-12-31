import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class GetSchemaByUserIdRequest extends TGGetRequest {
  GetSchemaByUserIdRequest({required this.id});

  String id;

  @override
  String getUri() {
    return '${URIS.URI_GET_SCHEMA_BY_USER_ID}/$id/$id';
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
