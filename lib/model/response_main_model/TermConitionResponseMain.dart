import 'dart:convert';

/// id : null
/// message : "Successfully get consent Details!!"
/// data : "<!doctype html>\n<html>\n<head>\n<title>Terms & Conditions</title>\n<div>\nI hereby give my consent to become a member of \n‘Pradhan Mantri Jeevan Jyoti Bima Yojana’ of Life Insurance Corporation of India\n which will be administered by your Bank / Post Office under Master Policy No. lic-ib-56464532\n I hereby authorize you to debit Rs.436.0 from my bank account towards premium of life insurance cover of \n Rs 2 lakhs under PMJJBY. I further authorize you to deduct in future after 25th May and not later\n than 1st of June every year until further instructions, an amount of\n Rs.436.0/- (Rupees four hundred thirty-six only), or any amount as decided \n from time to time, which may be intimated immediately if and when revised, towards renewal\n of coverage under the scheme. I have not authorized any other Bank / Post Office to\n debit premium in respect of this scheme. I am aware that in case of multiple enrolments for the scheme by me,\n my insurance cover will be restricted to Rs. two lakhs only and the premium paid by me for multiple enrolments \n shall be liable to be forfeited. I have read and understood the Scheme rules and I hereby give my consent to \n become a member of the Scheme. I am aware that the risk will not be covered during the first 30 days from the \n date of enrollment / re-joining into the scheme (lien period) and in case of death (other than due to accident) \n during lien period, no claim would be admissible. I authorize the Bank /Post Office to convey my personal details,\n given below, as required, regarding my admission into the group insurance scheme to Life Insurance Corporation of India I hereby declare that the \n above statements are true in all respects and that I agree and declare that the above information shall form \n the basis of admission to the above scheme and that if any information be found untrue, my membership to the \n scheme shall be treated as cancelled.\n \n If the enrolment takes place on any day during the months of\n - a. June, July & August –Annual premium of Rs. 436.0/- is payable \n b. September, October & November –3 quarters of premium @ Rs. 114.0 i.e. Rs. 342.0/- is payable \n c. December, January & February – 2 quarters of premium @ Rs. 114.0 i.e. Rs. 228.0/- is payable \n d. March, April & May – 1 Quarterly premium @ Rs. 114.0 is payable. \n e. Risk cover will start from the date of auto-debit of premium from the account of the subscriber.\n</div>\n</head>\n<body>\nContent goes here.\n</body>\n</html>"
/// status : 200
/// flag : true

TermConitionResponseMain termConitionResponseMainFromJson(String str) =>
    TermConitionResponseMain.fromJson(json.decode(str));
String termConitionResponseMainToJson(TermConitionResponseMain data) => json.encode(data.toJson());

class TermConitionResponseMain {
  TermConitionResponseMain({
    dynamic id,
    String? message,
    dynamic data,
    int? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  TermConitionResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  dynamic _data;
  int? _status;
  bool? _flag;
  TermConitionResponseMain copyWith({
    dynamic id,
    String? message,
    dynamic data,
    int? status,
    bool? flag,
  }) =>
      TermConitionResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  dynamic get data => _data;
  int? get status => _status;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['data'] = _data;
    map['status'] = _status;
    map['flag'] = _flag;
    return map;
  }
}
