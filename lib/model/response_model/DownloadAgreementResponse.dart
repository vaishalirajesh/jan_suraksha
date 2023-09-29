import '../../services/response/tg_response.dart';

class GetCoiAgreementResponseMain extends TGResponse {
  GetCoiAgreementResponse _loginResponseMainModel = GetCoiAgreementResponse();

  GetCoiAgreementResponseMain();

  GetCoiAgreementResponseMain.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _loginResponseMainModel = GetCoiAgreementResponse.fromJson(json);
  }

  GetCoiAgreementResponse getLoginResponseData() {
    return _loginResponseMainModel;
  }
}

class GetCoiAgreementResponse {
  Null? id;
  String? message;
  String? data;
  int? status;
  bool? flag;

  GetCoiAgreementResponse({this.id, this.message, this.data, this.status, this.flag});

  GetCoiAgreementResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    data = json['data'];
    status = json['status'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['data'] = this.data;
    data['status'] = this.status;
    data['flag'] = this.flag;
    return data;
  }
}
