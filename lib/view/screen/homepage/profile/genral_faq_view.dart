import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

import '../../../../config/color_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/utils.dart';
import '../../../widget/app_common_screen.dart';
import 'genral_faq_logic.dart';

const faqs = {
  "What is Jansuraksha Portal ?":
      "What is Jansuraksha Portal ? Jansuraksha is a Digital platform envisaged by the Department of Financial Services, Ministry of Finance to provide access to Social Security Insurance Schemes at affordable rates, introduced by the Government of India. Banks and insurance companies have partnered on the Jansuraksha portal to provide a digital journey for the subscribers for enrollments, issuance of policy certificates and claims processing.The portal has been jointly created and is being maintained by the General insurance Council, the Life Insurance Council and the Indian Banks Association.",
  "What are the schemes available?": "Currently there are two schemes, PMSBY and PMJJBY each having different eligibility criteria. For more details, please refer to the scheme details at https://jansuraksha.gov.in",
  "How can I apply to the schemes?":
      "The schemes are linked closely to KYC verified bank accounts. There are two methods of enrollment into the schemes.For a customer direct journey, Once an individual inputs the basic details of the bank account, the requisite data is automatically fetched from the Banks through secure integration. All basic documentation needs to be updated at the bank.In case of a bank assisted journey, the customer has to submit a duly filled in consent -cum-declaration form for enrollments to his bank/post office branch along with the required documents. You may access the form here",
  "What are the documents required?": "There is a enrollment form and some proof that are required. The details of the same can be found on the link"
};

class GenralFaqPage extends StatelessWidget {
  GenralFaqPage({Key? key}) : super(key: key);

  final logic = Get.find<GenralFaqLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      appbarName: AppString.appBarWithTitle,
      title: "FAQs",
      buttonTitle: "",
      onButtonClick: () {},
      onBackButtonCLick: AppUtils.onBackToDashboard,
      isDataLoading: false,
      isButtonEnable: true,
      isShowButton: true,
      child: ConstrainedFlexView(1.sh,
          child: SizedBox(
            height: 0.6.sh,
            child: ListView.builder(
              itemCount: faqs.values.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    logic.isExpanded.value = index;
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (index + 1).toString() + ". " + faqs.keys.elementAt(index),
                                style: StyleConfig.mediumText16,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 24,
                                color: HexColor("#B9C4CB"),
                              )
                            ],
                          ),
                        ),
                      ),
                      Offstage(
                          offstage: logic.isExpanded.value == index,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                faqs.values.elementAt(index),
                                style: StyleConfig.mediumText16,
                              ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: HexColor("#24699E"),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          axis: Axis.vertical),
    );
  }
}
