import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';

class NomineeDetailsLogic extends GetxController {
  RxBool isDataVerify = true.obs;
  RxBool isChecked = true.obs;
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

  void onPressContinue() {
    Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding());
  }

  String dob = '';
  DateTime date = DateTime.now();
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
}
