import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class GetOrgMasterListRequest extends TGGetRequest {
  GetOrgMasterListRequest({required this.id});

  String id;

  @override
  String getUri() {
    return '${URIS.URI_ORG_MASTER_LIST}/$id';
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
