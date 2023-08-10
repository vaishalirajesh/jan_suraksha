import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consent_fail_logic.dart';

class ConsentFailPage extends StatelessWidget {
  const ConsentFailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consentFailLogic = Get.find<ConsentFailLogic>();
    return const Scaffold(body: Text("Consent Fail"));
  }
}
