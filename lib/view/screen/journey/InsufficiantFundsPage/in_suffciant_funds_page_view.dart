import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../ResponseView/response_view_view.dart';
import 'in_suffciant_funds_page_logic.dart';

class InSuffciantFundsPagePage extends StatelessWidget {
  InSuffciantFundsPagePage({Key? key}) : super(key: key);

  final logic = Get.find<InSuffciantFundsPageLogic>();

  @override
  Widget build(BuildContext context) {
    return ResponseViewPage(
      image: Assets.responsepageFatherWithChildren,
      title: 'Oops!',
      titleMessege:
          'The transaction seems to have failed due to insufficient funds. Please ensure you have sufficient funds in the account and try again.',
      options: ["Try again"],
      action: [() {}],
      subTitle: '',
    );
  }
}
