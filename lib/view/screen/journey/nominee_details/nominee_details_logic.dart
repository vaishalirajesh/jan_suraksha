import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';

class NomineeDetailsLogic extends GetxController {
  RxBool isChecked = true.obs;
  RxBool isLoading = false.obs;
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();
  Nominee nominee = Nominee();
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController middleNameController = TextEditingController(text: '');
  TextEditingController latsNameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController pinCodeController = TextEditingController(text: '');
  TextEditingController stateController = TextEditingController(text: '');
  TextEditingController cityController = TextEditingController(text: '');
  TextEditingController districtController = TextEditingController(text: '');
  TextEditingController addressOneController = TextEditingController(text: '');
  TextEditingController addressTwoController = TextEditingController(text: '');
  TextEditingController dobController = TextEditingController(text: '');
  TextEditingController relationWithApplicantController = TextEditingController(text: '');

  String dob = '';
  DateTime date = DateTime.now();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSharedPreferences.getInstance().get(PREF_USER_FORM_DATA);
      getAppData = getApplicationFormDetailsResponseMainFromJson(data);
      nominee = getAppData.data?.nominee!.first ?? Nominee();
      firstNameController.text = nominee.firstName ?? '';
      latsNameController.text = nominee.lastName ?? '';
      middleNameController.text = nominee.middleName ?? '';
      dobController.text = AppUtils.convertDateFormat(nominee.dateOfBirth, 'yyyy-mm-dd', 'dd/mm/yyyy') ?? '';
      mobileController.text = nominee.mobileNumber ?? '';
      relationWithApplicantController.text = nominee.relationOfNomineeApplicantStr ?? '';
      emailController.text = nominee.emailIdOfNominee ?? '';
      addressOneController.text = nominee.address?.addressLine1 ?? '';
      addressTwoController.text = nominee.address?.addressLine2 ?? '';
      cityController.text = nominee.address?.city ?? '';
      districtController.text = nominee.address?.district ?? '';
      stateController.text = nominee.address?.state ?? '';
      pinCodeController.text = nominee.address?.pincode != null ? '${nominee.address?.pincode}' : '';
      isLoading.value = true;
    });
  }

  Future selectDate() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    DateTime currentDate = DateTime.now();
    int firstDateYear = currentDate.year - 18;
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      date = picked;
      String month = getmonth(date.month);
      if (month.isNotEmpty && month.length > 4) {
        month = month.substring(0, 3);
      }
      dobController.text = '${date.day}/${date.month}/${date.year}';
      dob = '${date.day}/${date.month}/${date.year}';
    }
  }

  String getmonth(int month) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  void setData() {
    nominee.firstName = firstNameController.text;
    getAppData.data?.nominee = [nominee];
    TGLog.d("First Name--${getAppData.data?.nominee!.first.firstName}");
  }

  void onPressContinue() {
    if (isLoading.value) {
      setData();
      Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding());
    }
  }
}
