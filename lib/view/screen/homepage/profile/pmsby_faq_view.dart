import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/utils.dart';
import '../../../widget/app_common_screen.dart';
import 'genral_faq_logic.dart';

class PMSBYFaqPage extends StatelessWidget {
  PMSBYFaqPage({Key? key}) : super(key: key);

  final logic = Get.find<GeneralFaqLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "PMSBY FAQs",
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
              buildMainView(
                question: '1. What is the nature of the scheme? ',
                answer:
                    "The scheme is a one year cover Personal Accident Insurance Scheme, renewable from year to year, offering protection against death or disability due to accident.",
                index: 0,
                onTap: () {
                  logic.isPMSBYExpanded[0].value = !logic.isPMSBYExpanded[0].value;
                },
              ),
              buildMainView(
                question: '2. What would be the benefits under the scheme and premium payable?',
                answer:
                    "The benefits payable under the scheme on death or disability due to accident are as follows:\n\n1.Rs.2 lakh is payable on member’s death due to accident.\n2.Rs.2 lakh is payable for Total and irrecoverable loss of both eyes or loss of use of both hands or feet or loss of sight of one eye and loss of use of hand or foot.\n3.Rs.1 lakh is payable for Total and irrecoverable loss of sight of one eye or loss of use of one hand or foot.",
                index: 1,
                onTap: () {
                  logic.isPMSBYExpanded[1].value = !logic.isPMSBYExpanded[1].value;
                },
              ),
              buildMainView(
                question: '3. What do you mean by “accident”?',
                answer:
                    "Accident means a sudden, unforeseen and involuntary event caused by external, violent and visible means.",
                index: 2,
                onTap: () {
                  logic.isPMSBYExpanded[2].value = !logic.isPMSBYExpanded[2].value;
                },
              ),
              buildMainView(
                question: '4.How will the premium be paid?',
                answer:
                    "The premium will be deducted from the account holder’s bank / Post office account through ‘auto debit’ facility in one instalment, as per the consent given by the subscriber at the time of enrolment.",
                index: 3,
                onTap: () {
                  logic.isPMSBYExpanded[3].value = !logic.isPMSBYExpanded[3].value;
                },
              ),
              buildMainView(
                question: '5. Who will offer / administer the scheme?',
                answer:
                    "The scheme is offered/administered through Public sector general insurance companies and other General insurance companies willing to offer the product with necessary approvals on similar terms, in collaboration with participating Banks / Post office. Participating banks / Post office are free to engage any such general insurance company for implementing the scheme for their account holders / subscribers.",
                index: 4,
                onTap: () {
                  logic.isPMSBYExpanded[4].value = !logic.isPMSBYExpanded[4].value;
                },
              ),
              buildMainView(
                question: '6. Who will be eligible to subscribe?',
                answer:
                    "All individual (single or joint) account holders of participating banks / Post office, in the age group of 18 to 70 years are entitled to join. In case of multiple accounts held by an individual in one or different banks / Post offices, the person is eligible to join the scheme through one bank / Post office account only.",
                index: 5,
                onTap: () {
                  logic.isPMSBYExpanded[5].value = !logic.isPMSBYExpanded[5].value;
                },
              ),
              buildMainView(
                question: '7. What is the enrolment period and modality?',
                answer:
                    "The cover shall be for one-year period stretching from 1st June to 31st May. At the time of enrolment, subscriber has to provide consent, to join / pay by auto-debit from the designated individual bank / Post office account, until further instructions, an amount of Rs.20/- (Rupees Twenty only) per annum, or any amount as decided from time to time, which may be intimated immediately if and when revised, towards renewal of coverage under the scheme. Delayed enrolment / renewal subsequent to this date will be possible on payment of annual premium.",
                index: 6,
                onTap: () {
                  logic.isPMSBYExpanded[6].value = !logic.isPMSBYExpanded[6].value;
                },
              ),
              buildMainView(
                question:
                    '8. Can eligible individuals who fail to join the scheme in the initial year join in subsequent years?',
                answer:
                    "Yes, new eligible entrants can also join in future years on payment of premium through auto-debit. However, risk cover would start from the date of auto debit of premium from the subscriber’s account.",
                index: 7,
                onTap: () {
                  logic.isPMSBYExpanded[7].value = !logic.isPMSBYExpanded[7].value;
                },
              ),
              buildMainView(
                question: "9. Can individuals who leave the scheme re-join?",
                answer:
                    "Individuals who exit the scheme at any point may re-join the scheme in future years by paying the annual premium, subject to conditions that may be laid down. However, risk cover would start from the date of auto debit of premium from the subscriber’s account.",
                index: 8,
                onTap: () {
                  logic.isPMSBYExpanded[8].value = !logic.isPMSBYExpanded[8].value;
                },
              ),
              buildMainView(
                question: "10. Who would be the Master policy holder for the scheme?",
                answer: "Participating Banks/ Post office are the Master policy holders for the scheme.",
                index: 9,
                onTap: () {
                  logic.isPMSBYExpanded[9].value = !logic.isPMSBYExpanded[9].value;
                },
              ),
              buildMainView(
                question: "11. When can the accident cover assurance terminate?",
                answer:
                    "The accident cover of the member shall terminate / be restricted accordingly on any of the following events:\n\n1. On attaining 70 years or the end of the policy tenure of the subscriber already enrolled in the scheme. \n\n2. Closure of account with the Bank or insufficiency of balance to keep the insurance in force.\n\n3. In case a member is covered through more than one account and premium is received by the insurance company inadvertently, insurance cover will be restricted to one account and the premium shall be liable to be forfeited.",
                index: 10,
                onTap: () {
                  logic.isPMSBYExpanded[10].value = !logic.isPMSBYExpanded[10].value;
                },
              ),
              buildMainView(
                question:
                    "12. Will this cover be in addition to cover under any other insurance scheme the subscriber may be covered under?",
                answer: "Yes",
                index: 11,
                onTap: () {
                  logic.isPMSBYExpanded[11].value = !logic.isPMSBYExpanded[11].value;
                },
              ),
              buildMainView(
                question: "13. Can all holders of a joint bank account join the scheme through the said account?",
                answer:
                    "In case of a joint account, all holders of the said account can join the scheme provided they satisfy its eligibility criteria and pay the premium at the rate of Rs.20 per person per annum through auto-debit.",
                index: 12,
                onTap: () {
                  logic.isPMSBYExpanded[12].value = !logic.isPMSBYExpanded[12].value;
                },
              ),
              buildMainView(
                question: "14. Are NRIs eligible for coverage under PMSBY?",
                answer:
                    "Any NRI having an eligible bank account with a bank branch located in India is eligible for purchase of PMSBY cover subject to fulfillment of the terms and conditions relating to the scheme. However, in case a claim arises, the claim benefit will be paid to the beneficiary/ nominee only in Indian currency.",
                index: 13,
                onTap: () {
                  logic.isPMSBYExpanded[13].value = !logic.isPMSBYExpanded[13].value;
                },
              ),
              buildMainView(
                question: "15. Which Bank Accounts are eligible for subscribing to PMSBY?",
                answer:
                    "All bank account holders other than institutional account holders are eligible for subscribing to PMSBY scheme.",
                index: 14,
                onTap: () {
                  logic.isPMSBYExpanded[14].value = !logic.isPMSBYExpanded[14].value;
                },
              ),
              buildMainView(
                question:
                    "16. Does the PMSBY cover death resulting from natural calamities such as earthquake, flood and other convulsions of nature? What about coverage from suicide / murder?",
                answer:
                    "Natural calamities being in the nature of accidents, any death / disability (as defined under PMSBY) resulting from such natural calamities is also covered under PMSBY. While death due to suicide is not covered, that from murder is covered.",
                index: 15,
                onTap: () {
                  logic.isPMSBYExpanded[15].value = !logic.isPMSBYExpanded[15].value;
                },
              ),
              buildMainView(
                question:
                    "17. Is there any provision for reimbursement of hospitalisation expenses following accident resulting in death or disablement?",
                answer: "No.",
                index: 16,
                onTap: () {
                  logic.isPMSBYExpanded[16].value = !logic.isPMSBYExpanded[16].value;
                },
              ),
              buildMainView(
                question:
                    "18. Who can claim insurance benefit in case of death of the bank account holder who gave the enrolment form?",
                answer:
                    "In case of death of the account holder/subscriber who enrolled in the scheme, claim can be filed by the nominee/appointee as per the enrolment form or by the legal heir/s in case nominee is pre-deceased",
                index: 17,
                onTap: () {
                  logic.isPMSBYExpanded[17].value = !logic.isPMSBYExpanded[17].value;
                },
              ),
              buildMainView(
                question: "19. What is the mode of payment of the claim amount?",
                answer:
                    "Disability claim will be credited in the bank account of the insured bank account holder / subscriber. Death claim will be remitted to the bank account of the nominee / legal heir(s).",
                index: 18,
                onTap: () {
                  logic.isPMSBYExpanded[18].value = !logic.isPMSBYExpanded[18].value;
                },
              ),
              buildMainView(
                question: "20. Will the family get insurance benefit if the account holder commits suicide?",
                answer: "No.",
                index: 19,
                onTap: () {
                  logic.isPMSBYExpanded[19].value = !logic.isPMSBYExpanded[19].value;
                },
              ),
              buildMainView(
                question:
                    "21. Is it necessary to report accidents to Police and obtain FIR for claiming benefits under the policy?",
                answer:
                    "In case of incidents like road, rail and similar vehicular accidents, drowning, death involving any crime etc, the accident should be reported to police. In case of incidents like snake bite, fall from tree etc, the cause should be supported by immediate hospital record.",
                index: 20,
                onTap: () {
                  logic.isPMSBYExpanded[20].value = !logic.isPMSBYExpanded[20].value;
                },
              ),
              buildMainView(
                question:
                    "22. If the insured is missing and death is not confirmed, will the legal heirs get benefit of insurance?",
                answer: "PMSBY covers deaths due to accident as confirmed by documentary evidence only.",
                index: 21,
                onTap: () {
                  logic.isPMSBYExpanded[21].value = !logic.isPMSBYExpanded[21].value;
                },
              ),
              buildMainView(
                question:
                    "23. What benefit will be payable if a person suffers partial disability without irrecoverable loss of sight of one eye or loss of use of one hand or foot?",
                answer: "No benefit will be payable.",
                index: 22,
                onTap: () {
                  logic.isPMSBYExpanded[22].value = !logic.isPMSBYExpanded[22].value;
                },
              ),
              buildMainView(
                question:
                    "24. Can an account holder get claim from more than one bank where he has enrolled and premium has been debited?",
                answer: "No. The insured/ nominee shall be eligible for one claim only.",
                index: 23,
                onTap: () {
                  logic.isPMSBYExpanded[23].value = !logic.isPMSBYExpanded[23].value;
                },
              ),
              buildMainView(
                question:
                    "25. Are PMSBY policies being introduced and serviced in association with foreign insurance Companies?",
                answer:
                    "There are no foreign insurance Companies directly operating in India. As permitted by the Insurance Act and IRDAI regulations there are some foreign Companies in joint ventures with Indian companies, where the stake of foreign insurers is restricted to 74% only.",
                index: 24,
                onTap: () {
                  logic.isPMSBYExpanded[24].value = !logic.isPMSBYExpanded[24].value;
                },
              ),
              buildMainView(
                question:
                    "26. Will the PMSBY scheme which is being promoted aggressively and sold in large numbers accrue huge profits to the foreign insurance Companies who in joint venture with Indian entities have floated life insurance companies and are operating this insurance cover?",
                answer:
                    "Only Indian Insurance Companies as defined in the Insurance Act can operate in India. The policy holders’ funds of all such insurance companies operating in India including those with foreign partners within the 74% cap is to be invested in India as per regulations and cannot be invested abroad. The premium charged for PMSBY has been worked out based on actuarial calculations considering all risk factors, current mortality rates and adverse selection. Thus, there is no scope for any huge profits accruing from the scheme.",
                index: 25,
                onTap: () {
                  logic.isPMSBYExpanded[25].value = !logic.isPMSBYExpanded[25].value;
                },
              ),
              buildMainView(
                question:
                    "27. In case of non-settlement of claims is it possible to proceed legally against the foreign insurers in India?",
                answer:
                    "There are no foreign insurance Companies directly operating in India. As permitted by the regulations there are Companies operating as joint ventures with Indian companies, where the stake of foreign insurers is restricted to 74% only. By definition, these are Indian insurance companies. All these companies are subject to Indian laws and there is no bar against proceeding legally against them.",
                index: 26,
                onTap: () {
                  logic.isPMSBYExpanded[26].value = !logic.isPMSBYExpanded[26].value;
                },
              ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: StyleConfig.mediumText15,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  width: 5.w,
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
      {required String question,
      required String answer,
      required int index,
      required VoidCallback onTap,
      Widget? widget}) {
    return Container(
      color: ColorConfig.jsCreamColor,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: StyleConfig.mediumText15.copyWith(color: ColorConfig.jsPrimaryColor),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
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
            widget ??
                Text(
                  answer,
                  style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildMainView(
      {required String question,
      required String answer,
      required int index,
      required VoidCallback onTap,
      Widget? widget}) {
    return Obx(() {
      return logic.isPMSBYExpanded[index].value
          ? buildExpandedQuestionWidget(question: question, index: 0, onTap: onTap, answer: answer, widget: widget)
          : buildQuestionWidget(
              question: question,
              index: 0,
              onTap: onTap,
              answer: '',
            );
    });
  }
}
