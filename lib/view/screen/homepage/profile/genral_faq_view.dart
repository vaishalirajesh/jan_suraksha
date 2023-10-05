import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/utils.dart';
import '../../../widget/app_common_screen.dart';
import 'genral_faq_logic.dart';

const faqs = {
  "What is Jansuraksha Portal ?":
      "What is Jansuraksha Portal ? Jansuraksha is a Digital platform envisaged by the Department of Financial Services, Ministry of Finance to provide access to Social Security Insurance Schemes at affordable rates, introduced by the Government of India. Banks and insurance companies have partnered on the Jansuraksha portal to provide a digital journey for the subscribers for enrollments, issuance of policy certificates and claims processing.The portal has been jointly created and is being maintained by the General insurance Council, the Life Insurance Council and the Indian Banks Association.",
  "What are the schemes available?":
      "Currently there are two schemes, PMSBY and PMJJBY each having different eligibility criteria. For more details, please refer to the scheme details at https://jansuraksha.gov.in",
  "How can I apply to the schemes?":
      "The schemes are linked closely to KYC verified bank accounts. There are two methods of enrollment into the schemes.For a customer direct journey, Once an individual inputs the basic details of the bank account, the requisite data is automatically fetched from the Banks through secure integration. All basic documentation needs to be updated at the bank.In case of a bank assisted journey, the customer has to submit a duly filled in consent -cum-declaration form for enrollments to his bank/post office branch along with the required documents. You may access the form here",
  "What are the documents required?":
      "There is a enrollment form and some proof that are required. The details of the same can be found on the link"
};

class GeneralFaqPage extends StatelessWidget {
  GeneralFaqPage({Key? key}) : super(key: key);

  final logic = Get.find<GenralFaqLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "FAQs",
        buttonTitle: "",
        onButtonClick: () {},
        onBackButtonCLick: AppUtils.onBackPress,
        isDataLoading: false,
        isButtonEnable: true,
        isShowButton: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Obx(() {
                return logic.isExpanded.value
                    ? buildExpandedQuestionWidget(
                        question: '1. What is Jansuraksha Portal ?',
                        index: 0,
                        onTap: () {
                          logic.isExpanded.value = !logic.isExpanded.value;
                        },
                        answer:
                            "Jansuraksha is a Digital platform envisaged by the Department of Financial Services, Ministry of Finance to provide access to Social Security Insurance Schemes at affordable rates, introduced by the Government of India. Banks and insurance companies have partnered on the Jansuraksha portal to provide a digital journey for the subscribers for enrollments, issuance of policy certificates and claims processing. \n\nThe portal has been jointly created and is being maintained by the General insurance Council, the Life Insurance Council and the Indian Banks Association.")
                    : buildQuestionWidget(
                        question: '1. What is Jansuraksha Portal ?',
                        index: 0,
                        onTap: () {
                          logic.isExpanded.value = !logic.isExpanded.value;
                        },
                        answer: '',
                      );
              }),
              buildQuestionWidget(question: '2. What are the schemes available?', onTap: () {}, answer: '', index: 2),
              buildQuestionWidget(question: '3. How can I apply to the schemes?', onTap: () {}, answer: '', index: 2),
              buildQuestionWidget(question: '4. What are the documents required?', onTap: () {}, answer: '', index: 2),
              buildQuestionWidget(question: '5. Who can apply for the scheme?', onTap: () {}, answer: '', index: 2),
              buildQuestionWidget(question: '6. How can a claim be filed?', onTap: () {}, answer: '', index: 2),
              buildQuestionWidget(question: '7. Who will settle the claim?', onTap: () {}, answer: '', index: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerWidget({required String question, required String answer}) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(18.r)),
        border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w),
      ),
    );
  }

  Widget buildQuestionWidget(
      {required String question, required String answer, required int index, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  question,
                  style: StyleConfig.mediumText15,
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: ColorConfig.jsDividerGreyColor,
                  size: 25.r,
                )
              ],
            ),
            SizedBox(height: 10.h),
            Divider(
              color: ColorConfig.jsDividerGreyColor,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildExpandedQuestionWidget(
      {required String question, required String answer, required int index, required VoidCallback onTap}) {
    return Container(
      color: ColorConfig.jsCreamColor,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    question,
                    style: StyleConfig.mediumText15.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up_sharp,
                    color: ColorConfig.jsDividerGreyColor,
                    size: 25.r,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              answer,
              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
