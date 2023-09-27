import 'package:jan_suraksha/model/response_main_model/GetEnrollmentListResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetEnrollmentListResponse extends TGResponse {
  GetEnrollmentListResponseMain _getEnrollmentListResponseMain = GetEnrollmentListResponseMain();

  GetEnrollmentListResponse();

  GetEnrollmentListResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getEnrollmentListResponseMain = GetEnrollmentListResponseMain.fromJson(json);
  }

  GetEnrollmentListResponseMain getEnrollmentList() {
    return _getEnrollmentListResponseMain;
  }
}
