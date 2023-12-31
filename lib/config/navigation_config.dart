import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_binding.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_view.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/screen/homepage/policy_details_screen/policy_details_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/policy_details_screen/policy_details_view.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_view.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_view.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_view.dart';
import 'package:jan_suraksha/view/screen/journey/ExceededAgeCriteareaPage/exceeded_age_critearea_page_binding.dart';
import 'package:jan_suraksha/view/screen/journey/ExceededAgeCriteareaPage/exceeded_age_critearea_page_view.dart';
import 'package:jan_suraksha/view/screen/journey/InsufficiantFundsPage/in_suffciant_funds_page_binding.dart';
import 'package:jan_suraksha/view/screen/journey/InsufficiantFundsPage/in_suffciant_funds_page_view.dart';
import 'package:jan_suraksha/view/screen/journey/PolicyAvailaedPage/policy_availed_page_binding.dart';
import 'package:jan_suraksha/view/screen/journey/PolicyAvailaedPage/policy_availed_page_view.dart';
import 'package:jan_suraksha/view/screen/journey/account_selection/account__selection__binding.dart';
import 'package:jan_suraksha/view/screen/journey/account_selection/account__selection__view.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_view.dart';
import 'package:jan_suraksha/view/screen/journey/bank_selection/bank_selection_view.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_binding.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_view.dart';
import 'package:jan_suraksha/view/screen/journey/congratulations/congratulations_screen_binding.dart';
import 'package:jan_suraksha/view/screen/journey/congratulations/congratulations_screen_view.dart';
import 'package:jan_suraksha/view/screen/journey/customer_verification/customer_verification_binding.dart';
import 'package:jan_suraksha/view/screen/journey/customer_verification/customer_verification_view.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';
import 'package:jan_suraksha/view/screen/journey/scheme_selection/select_scheme_binding.dart';
import 'package:jan_suraksha/view/screen/journey/scheme_selection/select_scheme_view.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:jan_suraksha/view/screen/journey/transaction_failure/transactions_failure__binding.dart';
import 'package:jan_suraksha/view/screen/journey/transaction_failure/transactions_failure__view.dart';
import 'package:jan_suraksha/view/screen/splash/splash_screen_binding.dart';
import 'package:jan_suraksha/view/screen/splash/splash_screen_view.dart';

import '../view/screen/homepage/personal_info_binding.dart';
import '../view/screen/homepage/personal_info_view.dart';
import '../view/screen/homepage/profile/profile_binding.dart';
import '../view/screen/journey/application_form/application_form_binding.dart';
import '../view/screen/journey/bank_selection/bank_selection_binding.dart';
import '../view/screen/journey/terms_and_conditions/terms_and_conditions_binding.dart';

const SplashRoutes = "/";
const LoginPageRoute = "/MobileNumberInputPage";
const DashboardPageRoute = "/DashboardPage";
const PolicyDetailsPageRoute = "/PolicyDetailsPage";
const ProfilePageRoute = "/ProfilePage";
const ServicesPageRoute = "/ServicesPage";
const SupportPageRoute = "/SupportPage";
const AccountSelectionPageRoute = "/AccountSelectionPage";
const AddressDetailsPageRoute = "/AddressDetailsPage";
const ApplicationFormPageRoute = "/ApplicationFormPage";
const BankSelectionPageRoute = "/BankSelectionPage";
const CertificateInsurencePageRoute = "/CertificateInsurencePage";
const CongratulationsPageRoute = "/CongratulationsPage";
const CustomerVerificationPageRoute = "/CustomerVerificationPage";
const GuradianDetailsPageRoute = "/GuradianDetailsPage";
const NomineeDetailsPageRoute = "/NomineeDetailsPage";
const PreviewApplicationPageRoute = "/PreviewApplicationPage";
const SelectSchemePageRoute = "/SelectSchemePage";
const TermsAndConditionsPageRoute = "/TermsAndConditionsPage";
const TransactionsFailurePageRoute = "/TransactionsFailurePage";
const ResponseScreenRoute = "/ResponseScreenRoute";
const ExceededAgeCriteareaPageRoute = "/ExceededAgeCriteareaPagePage";
const InSuffciantFundsPageRoute = "/InSuffciantFundsPagePage";
const PolicyAvailedPageRoute = "/PolicyAvailedPageRoute";
const RegistrationPageRoute = "/RegistrationPage";
const PersonalInfoPageRoute = '/PersonalInfoPage';

class NavigationConfig {
  static GetPage get initialRoute => splash;
  static final GetPage splash = GetPage(
    binding: SplashScreenBinding(),
    name: SplashRoutes,
    page: () => SplashScreenPage(),
  );

  static List<GetPage> getPages() {
    return [
      GetPage(name: PersonalInfoPageRoute, page: () => PersonalInfoPage(), binding: PersonalInfoBinding()),
      GetPage(name: PolicyAvailedPageRoute, page: () => PolicyAvailedPagePage(), binding: PolicyAvailedPageBinding()),
      GetPage(
          name: ExceededAgeCriteareaPageRoute,
          page: () => ExceededAgeCriteareaPagePage(),
          binding: ExceededAgeCriteareaPageBinding()),
      GetPage(
          name: InSuffciantFundsPageRoute,
          page: () => InSuffciantFundsPagePage(),
          binding: InSuffciantFundsPageBinding()),
      GetPage(name: SplashRoutes, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
      GetPage(name: LoginPageRoute, page: () => LoginPage(), binding: LoginBinding()),
      GetPage(name: DashboardPageRoute, page: () => DashboardPage(), binding: DashboardBinding()),
      GetPage(name: PolicyDetailsPageRoute, page: () => PolicyDetailsPage(), binding: PolicyDetailsBinding()),
      GetPage(name: ProfilePageRoute, page: () => ProfilePage(), binding: ProfileBinding()),
      GetPage(name: ServicesPageRoute, page: () => ServicesPage(), binding: ServicesTabBinding()),
      GetPage(name: SupportPageRoute, page: () => SupportPage(), binding: SupportBinding()),
      GetPage(name: AccountSelectionPageRoute, page: () => AccountSelectionPage(), binding: AccountSelectionBinding()),
      GetPage(name: AddressDetailsPageRoute, page: () => AddressDetailsPage(), binding: AddressDetailsBinding()),
      GetPage(name: ApplicationFormPageRoute, page: () => ApplicationFormPage(), binding: ApplicationFormBinding()),
      GetPage(name: BankSelectionPageRoute, page: () => BankSelectionPage(), binding: BankSelectionBinding()),
      GetPage(name: RegistrationPageRoute, page: () => RegistrationPage(), binding: RegistrationBinding()),
      GetPage(
          name: CertificateInsurencePageRoute,
          page: () => CertificateInsurencePage(),
          binding: CertificateInsurenceBinding()),
      GetPage(name: CongratulationsPageRoute, page: () => CongratulationsPage(), binding: CongratulationsBinding()),
      GetPage(
          name: CustomerVerificationPageRoute,
          page: () => CustomerVerificationPage(),
          binding: CustomerVerificationBinding()),
      GetPage(name: GuradianDetailsPageRoute, page: () => GuradianDetailsPage(), binding: GuradianDetailsBinding()),
      GetPage(name: NomineeDetailsPageRoute, page: () => NomineeDetailsPage(), binding: NomineeDetailsBinding()),
      GetPage(
          name: PreviewApplicationPageRoute,
          page: () => PreviewApplicationPage(),
          binding: PreviewApplicationBinding()),
      GetPage(name: SelectSchemePageRoute, page: () => SelectSchemePage(), binding: SelectSchemeBinding()),
      GetPage(
          name: TermsAndConditionsPageRoute,
          page: () => TermsAndConditionsPage(),
          binding: TermsAndConditionsBinding()),
      GetPage(
          name: TransactionsFailurePageRoute,
          page: () => TransactionsFailurePage(),
          binding: TransactionsFailureBinding()),
    ];
  }
}
