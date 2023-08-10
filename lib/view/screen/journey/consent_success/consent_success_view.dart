import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consent_success_logic.dart';

class ConsentSuccessPage extends StatelessWidget {
  const ConsentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consentSuccessLogic = Get.find<ConsentSuccessLogic>();
    return const Scaffold(body: Center(child: Text("Consent Success")));
  }
}
