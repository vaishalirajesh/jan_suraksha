import 'package:get/get.dart';

import 'ongoing_pmsby_journey_logic.dart';

class OngoingPmsbyJourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OngoingPmsbyJourneyLogic>(OngoingPmsbyJourneyLogic());
  }
}
