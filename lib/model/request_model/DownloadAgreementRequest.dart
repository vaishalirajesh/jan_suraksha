class DownloadAgreementRequest {
  String? applicationId;
  String? schemeId;
  String? orgId;
  bool? isDownload;

  DownloadAgreementRequest({this.applicationId, this.schemeId, this.orgId, this.isDownload});

  DownloadAgreementRequest.fromJson(Map<String, dynamic> json) {
    applicationId = json['applicationId'];
    schemeId = json['schemeId'];
    orgId = json['orgId'];
    isDownload = json['isDownload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationId'] = this.applicationId;
    data['schemeId'] = this.schemeId;
    data['orgId'] = this.orgId;
    data['isDownload'] = this.isDownload;
    return data;
  }
}
