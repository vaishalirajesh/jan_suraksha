import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/Navigation_config.dart';

import '../../../../generated/assets.dart';
import '../ResponseView/response_view_view.dart';
import 'policy_availed_page_logic.dart';

class PolicyAvailedPagePage extends StatelessWidget {
  PolicyAvailedPagePage({Key? key}) : super(key: key);

  final logic = Get.find<PolicyAvailedPageLogic>();

  @override
  Widget build(BuildContext context) {
    return ResponseViewPage(
      image: Assets.responsepageFatherWithChildren,
      title: 'Oops!',
      titleMessege: 'Seems like you have already availed the policy',
      subTitle: 'Do you wish to apply for any other account holder',
      options: ["Continue", "Exit"],
      action: [
        () {
          Get.toNamed(ApplicationFormPageRoute);
        },
        () {}
      ],
    );
  }
}
