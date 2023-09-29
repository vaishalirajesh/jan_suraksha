import '../../services/request/tg_get_request.dart';
import '../../services/uris.dart';

class DownloadAgreementRequest extends TGGetRequest {
  DownloadAgreementRequest();

  @override
  String getUri() {
    return URIS.URI_DOWNLOAD_AGREEMENT;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
