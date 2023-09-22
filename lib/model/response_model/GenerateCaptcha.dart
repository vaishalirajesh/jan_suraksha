class GenerateCaptcha {
  int? id;
  String? message;
  Data? data;
  int? status;
  bool? flag;

  GenerateCaptcha({this.id, this.message, this.data, this.status, this.flag});

  GenerateCaptcha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['flag'] = this.flag;
    return data;
  }
}

class Data {
  String? captchaString;
  String? bytes;

  Data({this.captchaString, this.bytes});

  Data.fromJson(Map<String, dynamic> json) {
    captchaString = json['captchaString'];
    bytes = json['bytes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['captchaString'] = this.captchaString;
    data['bytes'] = this.bytes;
    return data;
  }
}
