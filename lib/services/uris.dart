abstract class URIS {
  static const URI_LOGIN = 'users/v3/login';
  static const URI_GET_ALL_MENU_BANKER = 'users/v3/getAllMenuForBanker';
  static const URI_GET_SCHEMA_BY_USER_ID = 'users/v3/roleProductMap/getSchemeByUserIdBusinessId';
  static const URI_GET_USER_DETAIL_BY_ID = 'users/v3/getUserDetailsById';
  static const URI_CREATE_APPLICATION = 'insurance/v3/application/create';
  static const URI_UPDATE_STAGE = 'insurance/v3/application/updateStage';
  static const URI_UPDATE_ENROLLMENT_VERIFICATION_TYPE = 'insurance/v3/enrollment/updateEnrollmentVerificationType';
  static const URI_VERIFY_PHYSICAL_SINGNATURE = 'insurance/v3/enrollment/verifyPhysicalSignature';
  static const URI_ENROLLMENT_VERIFY_OTP = 'insurance/v3/enrollment/verifyOtp';
  static const URI_UPDATE_SELECTED_ACCOUNT_HOLDER = 'insurance/v3/enrollment/updateSelectedAccountHolder';
  static const URI_GET_STAGE_DETAIL = 'insurance/v3/application/getStageDetails';
  static const URI_APP_FORM_DETAIL = 'insurance/v3/enrollment/getApplicationFormDetails';
  static const URI_VERIFY_LOGIN_OTP = 'users/v3/login/otp';
  static const URI_VERIFY_OTP = 'insurance/v3/enrollment/verifyOtp';
  static const URI_SAVE_FORM_DETAIL = 'insurance/v3/enrollment/saveApplicationFormDetails';
  static const URI_PREMIUM_DEDUCTION = 'insurance/v3/enrollment/premiumDeduction';
  static const URI_GENERATE_COI = 'insurance/v3/enrollment/generateCOI';
  static const URI_GEN_CAPTCH = "users/v3/signup/captcha/gen";
  static const URI_GET_MASTER_LIST = "oneform/v3/master/getMasterListByKey";
  static const URI_OTP = "users/login/otp";
  static const URI_SIGN_UP = "users/v3/signup/new";
  static const URI_SIGN_UP_VERIFY_OTP = "users/v3/signup/verifyOTP";
  static const URI_SIGN_UP_EMAIL_OTP = "users/v3/signup/sendEmailOTP";
  static const URI_ENROLLMENT_LIST = "insurance/v3/mobile/getEnrollmentList";
  static const URI_ORG_MASTER_LIST = "insurance/V3/insurer/getOrganisationMstListByUserTypeId";
  static const URI_GET_TERM_CONDITION = "insurance/v3/mobile/getConsentData";
  static const URI_LOGIN_WITH_MOBILE = "users/v3/send/login/otp";
}
