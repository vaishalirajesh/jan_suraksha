import 'package:jan_suraksha/model/response_main_model/SetPasswordResponseMain.dart';
import 'package:jan_suraksha/model/response_model/EnrollmentOtpVerifyResponse.dart';
import 'package:jan_suraksha/model/response_model/GenerateCoiResponse.dart';
import 'package:jan_suraksha/model/response_model/GetAllMenuForBankerResponse.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/model/response_model/GetEnrollmentListResponse.dart';
import 'package:jan_suraksha/model/response_model/GetMasterListResponse.dart';
import 'package:jan_suraksha/model/response_model/GetOrgMasterListResponse.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/model/response_model/GetStageDetailResponse.dart';
import 'package:jan_suraksha/model/response_model/GetTermConditionResponse.dart';
import 'package:jan_suraksha/model/response_model/GetUserDetailByIdResponse.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/model/response_model/LoginWithMobilResponse.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
import 'package:jan_suraksha/model/response_model/PreminumDeductionResponse.dart';
import 'package:jan_suraksha/model/response_model/SaveFormDetailResponse.dart';
import 'package:jan_suraksha/model/response_model/SkipEmailResponse.dart';
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
import '../model/response_main_model/LogOutResponse.dart';
import '../model/response_model/CreateApplicationResponse.dart';
import '../model/response_model/DownloadAgreementResponse.dart';
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
    TGService<SaveFormDetailResponse, ServiceError>(() => SaveFormDetailResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void premiumDeduction({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.premiumDeduction");
    TGService<PremiumDeductionResponse, ServiceError>(() => PremiumDeductionResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void generateCoi({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.generateCoi");
    TGService<GenerateCoiResponse, ServiceError>(() => GenerateCoiResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getMasterList({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getMasterList");
    TGService<GetMasterListResponse, ServiceError>(() => GetMasterListResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void otpRequest({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.otpRequest");
    TGService<OTPResponse, ServiceError>(() => OTPResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getEnrollmentList({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getEnrollmentList");
    TGService<GetEnrollmentListResponse, ServiceError>(() => GetEnrollmentListResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void loginWithMobile({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getLoginResponse");
    TGService<LoginWithMobilResponse, ServiceError>(() => LoginWithMobilResponse(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getOrgMasterList({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getOrgMasterList");
    TGService<GetOrgMasterListResponse, ServiceError>(() => GetOrgMasterListResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getTermConition({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.getTermConition");
    TGService<TermConitionResponse, ServiceError>(() => TermConitionResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void skipEmailDetails({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.skipEmailDetails");
    TGService<GetResponseForSkipEmailMain, ServiceError>(() => GetResponseForSkipEmailMain(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void downloadCoi({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.skipEmailDetails");
    TGService<GetCoiAgreementResponseMain, ServiceError>(() => GetCoiAgreementResponseMain(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void setPassword({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.skipEmailDetails");
    TGService<SetPasswordResponseMain, ServiceError>(() => SetPasswordResponseMain(), () => ServiceError()).post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void logOut({required TGGetRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.skipEmailDetails");
    TGService<LogOutResponse, ServiceError>(() => LogOutResponse(), () => ServiceError()).get(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }
}
