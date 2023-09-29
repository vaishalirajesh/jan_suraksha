class SetPasswordRequest {
  String? password;
  String? confirmPassword;
  int? userId;

  SetPasswordRequest({this.password, this.confirmPassword, this.userId});

  SetPasswordRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['userId'] = this.userId;
    return data;
  }
}
