import 'package:jan_suraksha/model/response_model/CreateApplicationResponse.dart';
import 'package:jan_suraksha/model/response_model/EnrollmentOtpVerifyResponse.dart';
import 'package:jan_suraksha/model/response_model/GetAllMenuForBankerResponse.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/model/response_model/GetStageDetailResponse.dart';
import 'package:jan_suraksha/model/response_model/GetUserDetailByIdResponse.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateEnrollmentVerificationTypeResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateSelectedAccountHolderResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyLoginOtpResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyPhysicalSignatureResponse.dart';
import 'package:jan_suraksha/model/response_model/error/service_error.dart';
import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/services_manager.dart';

import 'common/tg_log.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager();

  static ServiceManager getInstance() {
    return _instance;
  }

  void loginRequest({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<LoginResponse, ServiceError>(() => LoginResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getAllMenuForBanker({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<GetAllMenuForBankerResponse, ServiceError>(() => GetAllMenuForBankerResponse(), () => ServiceError())
        .get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getSchemaByUserId({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<GetSchemaByUserIdResponse, ServiceError>(() => GetSchemaByUserIdResponse(), () => ServiceError())
        .get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getUserDetailById({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<GetUserDetailByIdResponse, ServiceError>(() => GetUserDetailByIdResponse(), () => ServiceError())
        .get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void createApplicationResponse({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<CreateApplicationResponse, ServiceError>(() => CreateApplicationResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateApplicationStage({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<UpdateStageResponse, ServiceError>(() => UpdateStageResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void verifyPhysicalSignature({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<VerifyPhysicalSignatureResponse, ServiceError>(
            () => VerifyPhysicalSignatureResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void enrollmentOtpVerifyResponse({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<EnrollmentOtpVerifyResponse, ServiceError>(() => EnrollmentOtpVerifyResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateEnrollmentVerificationType({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<UpdateEnrollmentVerificationTypeResponse, ServiceError>(
            () => UpdateEnrollmentVerificationTypeResponse(), () => ServiceError())
        .get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getStageDetail({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<GetStageDetailResponse, ServiceError>(() => GetStageDetailResponse(), () => ServiceError())
        .get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateSelectedAccountHolder({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<UpdateSelectedAccountHolderResponse, ServiceError>(
            () => UpdateSelectedAccountHolderResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void verifyLoginOtp({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<VerifyLoginOtpResponse, ServiceError>(() => VerifyLoginOtpResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }
}
