import 'package:jan_suraksha/model/response_main_model/GetUserDetailByIdResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetUserDetailByIdResponse extends TGResponse {
  GetUserDetailByIdResponseMain _getUserDetailByIdResponseMain = GetUserDetailByIdResponseMain();

  GetUserDetailByIdResponse();

  GetUserDetailByIdResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getUserDetailByIdResponseMain = GetUserDetailByIdResponseMain.fromJson(json);
  }

  GetUserDetailByIdResponseMain getUserDetailById() {
    return _getUserDetailByIdResponseMain;
  }
}
