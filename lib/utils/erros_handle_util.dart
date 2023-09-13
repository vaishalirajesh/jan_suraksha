import 'package:flutter/cupertino.dart';
import 'package:jan_suraksha/model/response_model/error/service_error.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';

void handleServiceFailError(BuildContext context, ServiceError? serviceError) {
  if (serviceError != null) {
    if (serviceError.status == 401) {
    } else if (serviceError.status == 500) {
    } else {
      showSnackBar(context, serviceError.message ?? "Error");
    }
  }
}
