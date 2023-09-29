import 'dart:convert';





class UpdateEnrollmentVerificationTypeResponseMain {
  Null? id;
  String? message;
  Data? data;
  int? status;
  bool? flag;

  UpdateEnrollmentVerificationTypeResponseMain({this.id, this.message, this.data, this.status, this.flag});

  UpdateEnrollmentVerificationTypeResponseMain.fromJson(Map<String, dynamic> json) {
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
  String? mobileNumber;
  String? resendOTPTime;
  String? message;

  Data({this.mobileNumber, this.resendOTPTime, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    resendOTPTime = json['resendOTPTime'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['resendOTPTime'] = this.resendOTPTime;
    data['message'] = this.message;
    return data;
  }
}













// UpdateEnrollmentVerificationTypeResponseMain updateEnrollmentVerificationTypeResponseMainFromJson(String str) => UpdateEnrollmentVerificationTypeResponseMain.fromJson(json.decode(str));
// String updateEnrollmentVerificationTypeResponseMainToJson(UpdateEnrollmentVerificationTypeResponseMain data) => json.encode(data.toJson());
//
// class UpdateEnrollmentVerificationTypeResponseMain {
//   UpdateEnrollmentVerificationTypeResponseMain({
//     dynamic id,
//     String? message,
//     Data? data,
//     int? status,
//     bool? flag,
//   }) {
//     _id = id;
//     _message = message;
//     _data = data;
//     _status = status;
//     _flag = flag;
//   }
//
//   UpdateEnrollmentVerificationTypeResponseMain.fromJson(dynamic json) {
//     _id = json['id'];
//     _message = json['message'];
//     _data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
//     _status = json['status'];
//     _flag = json['flag'];
//   }
//
//
//
//   dynamic _id;
//   String? _message;
//   Data? _data;
//   int? _status;
//   bool? _flag;
//   UpdateEnrollmentVerificationTypeResponseMain copyWith({
//     dynamic id,
//     String? message,
//     Data? data,
//     int? status,
//     bool? flag,
//   }) =>
//       UpdateEnrollmentVerificationTypeResponseMain(
//         id: id ?? _id,
//         message: message ?? _message,
//         data: data ?? _data,
//         status: status ?? _status,
//         flag: flag ?? _flag,
//       );
//   dynamic get id => _id;
//   String? get message => _message;
//   Data get data => _data;
//   int? get status => _status;
//   bool? get flag => _flag;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['message'] = _message;
//     if (this.data != null) {
//       data['data'] = _.data!.toJson();
//     }
//     map['status'] = _status;
//     map['flag'] = _flag;
//     return map;
//   }
//
//
//
//
// }
//
//
// class Data {
//   String? mobileNumber;
//   String? resendOTPTime;
//   String? message;
//
//   Data({this.mobileNumber, this.resendOTPTime, this.message});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     mobileNumber = json['mobileNumber'];
//     resendOTPTime = json['resendOTPTime'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mobileNumber'] = this.mobileNumber;
//     data['resendOTPTime'] = this.resendOTPTime;
//     data['message'] = this.message;
//     return data;
//   }