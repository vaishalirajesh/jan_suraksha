import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';

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
  RxString fNameErrorMsg = ''.obs;
  RxString dobErrorMsg = ''.obs;
  RxString addressErrorMsg = ''.obs;
  RxString cityErrorMsg = ''.obs;
  RxString districtErrorMsg = ''.obs;
  RxString stateErrorMsg = ''.obs;
  RxString pinCodeErrorMsg = ''.obs;
  RxString selectedValue = 'hello'.obs;
  List<String> items = ['hello', 'hi'];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSession.getInstance().get(PREF_USER_FORM_DATA);
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
      var stringDate = '${date.day}/${date.month}/${date.year}';
      dobController.text = AppUtils.convertDateFormat(stringDate, 'dd/mm/yyyy', 'dd/mm/yyyy');
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

  bool isAdult(String birthDateString) {
    String datePattern = "dd/mm/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff > 0 || yearDiff == 18 && monthDiff == 0 && dayDiff >= 0;
  }

  Future<void> setData() async {
    nominee.firstName = firstNameController.text;
    nominee.lastName = latsNameController.text;
    nominee.mobileNumber = mobileController.text;
    nominee.middleName = middleNameController.text;
    nominee.emailIdOfNominee = emailController.text;
    nominee.relationOfNomineeApplicant = 1;
    // nominee.dateOfBirth = dob;
    nominee.address?.addressLine1 = addressOneController.text;
    nominee.address?.addressLine2 = addressTwoController.text;
    nominee.address?.city = cityController.text;
    nominee.address?.district = districtController.text;
    nominee.address?.state = stateController.text;
    nominee.address?.pincode = num.parse(pinCodeController.text);
    getAppData.data?.nominee = [nominee];
    TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
    TGLog.d("First Name--${getAppData.data?.nominee!.first.firstName}");
  }

  void onPressContinue() {
    TGLog.d("IsAduu---${isAdult(dobController.text)}");
    if (isLoading.value) {
      final validCharacters = RegExp(r'^[0-9]+$');
      if (firstNameController.text.isEmpty) {
        fNameErrorMsg.value = 'Please enter first name';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (dobController.text.isEmpty) {
        dobErrorMsg.value = 'Please select date of birth';
        fNameErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (addressOneController.text.isEmpty) {
        addressErrorMsg.value = 'Please enter address';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (cityController.text.isEmpty) {
        cityErrorMsg.value = 'Please enter city';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (stateController.text.isEmpty) {
        stateErrorMsg.value = 'Please enter state';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (districtController.text.isEmpty) {
        districtErrorMsg.value = 'Please enter district';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
      } else if (pinCodeController.text.isEmpty) {
        pinCodeErrorMsg.value = 'Please enter pincode';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
      } else if (!validCharacters.hasMatch(pinCodeController.text)) {
        pinCodeErrorMsg.value = 'Please enter valid pincode';
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
      } else {
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        districtErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
        setData();
        if (isAdult(dobController.text)) {
          Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
        } else {
          Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding());
        }
      }
    }
  }
}
