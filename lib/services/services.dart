import 'package:jan_suraksha/model/response_model/EnrollmentOtpVerifyResponse.dart';
import 'package:jan_suraksha/model/response_model/GenerateCoiResponse.dart';
import 'package:jan_suraksha/model/response_model/GetAllMenuForBankerResponse.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/model/response_model/GetStageDetailResponse.dart';
import 'package:jan_suraksha/model/response_model/GetUserDetailByIdResponse.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/model/response_model/PreminumDeductionResponse.dart';
import 'package:jan_suraksha/model/response_model/SaveFormDetailResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateEnrollmentVerificationTypeResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateSelectedAccountHolderResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyLoginOtpResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyOtpResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyPhysicalSignatureResponse.dart';
import 'package:jan_suraksha/model/response_model/error/service_error.dart';
import 'package:jan_suraksha/services/request/tg_get_request.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/services_manager.dart';

import '../model/response_main_model/GenerateCaptchaResponse.dart';
import '../model/response_model/CreateApplicationResponse.dart';
import 'common/tg_log.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager();

  static ServiceManager getInstance() {
    return _instance;
  }

  void loginRequest({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.LoginRequest");
    TGService<LoginResponse, ServiceError>(() => LoginResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getAllMenuForBanker({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getAllMenuForBanker");
    TGService<GetAllMenuForBankerResponse, ServiceError>(() => GetAllMenuForBankerResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getSchemaByUserId({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getSchemaByUserId");
    TGService<GetSchemaByUserIdResponse, ServiceError>(() => GetSchemaByUserIdResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getUserDetailById({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getUserDetailById");
    TGService<GetUserDetailByIdResponse, ServiceError>(() => GetUserDetailByIdResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void createApplication({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.createApplication");
    TGService<CreateApplicationResponse, ServiceError>(() => CreateApplicationResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateApplicationStage({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.updateApplicationStage");
    TGService<UpdateStageResponse, ServiceError>(() => UpdateStageResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void verifyPhysicalSignature({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.verifyPhysicalSignature");
    TGService<VerifyPhysicalSignatureResponse, ServiceError>(() => VerifyPhysicalSignatureResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void enrollmentOtpVerify({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.enrollmentOtpVerify");
    TGService<EnrollmentOtpVerifyResponse, ServiceError>(() => EnrollmentOtpVerifyResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateEnrollmentVerificationType({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.updateEnrollmentVerificationType");
    TGService<UpdateEnrollmentVerificationTypeResponse, ServiceError>(() => UpdateEnrollmentVerificationTypeResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getStageDetail({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getStageDetail");
    TGService<GetStageDetailResponse, ServiceError>(() => GetStageDetailResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getApplicationFormDetails({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getApplicationFormDetails");
    TGService<GetApplicationFormDetailsResponse, ServiceError>(() => GetApplicationFormDetailsResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void updateSelectedAccountHolder({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.updateSelectedAccountHolder");
    TGService<UpdateSelectedAccountHolderResponse, ServiceError>(() => UpdateSelectedAccountHolderResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void verifyLoginOtp({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.verifyLoginOtp");
    TGService<VerifyLoginOtpResponse, ServiceError>(() => VerifyLoginOtpResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void verifyOTP({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.verifyOTP");
    TGService<VerifyOTPResponse, ServiceError>(() => VerifyOTPResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getCaptcha({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getcaptcha");
    TGService<GenerateCaptchaResponse, ServiceError>(() => GenerateCaptchaResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void saveFormDetail({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.saveFormDetail");
    TGService<SaveFormDetailResponse, ServiceError>(() => SaveFormDetailResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void premiumDeduction({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.saveFormDetail");
    TGService<PremiumDeductionResponse, ServiceError>(() => PremiumDeductionResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void generateCoi({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.saveFormDetail");
    TGService<GenerateCoiResponse, ServiceError>(() => GenerateCoiResponse(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }
}
