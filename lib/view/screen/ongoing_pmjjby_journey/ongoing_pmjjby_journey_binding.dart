import 'package:get/get.dart';

import 'ongoing_pmjjby_journey_logic.dart';

class OngoingPmjjbyJourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OngoingPmjjbyJourneyLogic>(OngoingPmjjbyJourneyLogic());
  }
}
