import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customer_verificationLogic extends GetxController {
  var isbuttonenabled = true.obs;

  var accountTextController = TextEditingController();

  var reAccountTextController = TextEditingController();

  var dobTextController = TextEditingController();
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
      dobTextController.text = '${date.day}/${date.month}/${date.year}';
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
