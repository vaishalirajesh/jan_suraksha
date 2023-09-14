import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/utils.dart';

import 'policy_details_logic.dart';

class PolicyDetailsPage extends StatelessWidget {
  PolicyDetailsPage({Key? key}) : super(key: key);

  final logic = Get.find<Policy_detailsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Container(),
    );
  }
}
