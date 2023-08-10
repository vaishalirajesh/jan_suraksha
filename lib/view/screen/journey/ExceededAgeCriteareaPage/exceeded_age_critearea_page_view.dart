import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../ResponseView/response_view_view.dart';
import 'exceeded_age_critearea_page_logic.dart';

class ExceededAgeCriteareaPagePage extends StatelessWidget {
  ExceededAgeCriteareaPagePage({Key? key}) : super(key: key);

  final logic = Get.find<ExceededAgeCriteareaPageLogic>();

  @override
  Widget build(BuildContext context) {
    return ResponseViewPage(
      image: Assets.responsepageFatherWithChildren,
      title: 'Oops!',
      titleMessege:
          'Mrs. Kajal XXXX, as per the bank records, you have exceeded the age criteria for the scheme selected, thus you will not be able to proceed here.',
      subTitle: 'Do you wish to apply for any other account holder?',
      options: ["Continue", "Exit"],
      action: [() {}, () {}],
    );
  }
}
