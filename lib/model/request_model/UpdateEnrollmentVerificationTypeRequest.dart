import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/uris.dart';

class UpdateEnrollmentVerificationTypeRequest extends TGGetRequest {
  UpdateEnrollmentVerificationTypeRequest({required this.id, required this.type});

  String type;
  String id;

  @override
  String getUri() {
    return '${URIS.URI_UPDATE_ENROLLMENT_VERIFICATION_TYPE}/$id/$type';
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}
