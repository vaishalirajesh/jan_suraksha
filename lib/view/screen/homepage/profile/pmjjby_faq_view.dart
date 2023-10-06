import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/utils.dart';
import '../../../widget/app_common_screen.dart';
import 'genral_faq_logic.dart';

class PMJJBYFaqPage extends StatelessWidget {
  PMJJBYFaqPage({Key? key}) : super(key: key);

  final logic = Get.find<GeneralFaqLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "PMJJBY FAQs",
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
                    "The scheme is a one-year cover term life insurance scheme, renewable from year to year, offering life insurance cover for death due to any cause.",
                index: 0,
                onTap: () {
                  logic.isPMJJBYExpanded[0].value = !logic.isPMJJBYExpanded[0].value;
                },
              ),
              buildMainView(
                question: '2. What would be the benefits under the scheme and premium payable?',
                answer: "",
                index: 1,
                onTap: () {
                  logic.isPMJJBYExpanded[1].value = !logic.isPMJJBYExpanded[1].value;
                },
                widget: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Rs.2 lakh is payable on a subscriber’s death due to any cause.\n\nThe premium payable is Rs.436/- per annum per subscriber.\n\nFor those getting enrolled under PMJJBY for the first time during the middle of the policy period, payment of pro-rata premium is allowed as under\n\n* For enrolment in June, July and August – Full annual premium of Rs.436/- is payable.\n\n For enrolment in September, October, and November – pro rata premium of Rs. 342/- is payable.\n\nFor enrolment in December, January and February – pro rata premium of Rs. 228/- is payable. \n\nFor enrolment in March, April and May – pro rata premium of Rs. 114/- is payable.",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text:
                            "\nHowever, full year’s premium @ Rs 436/- is payable at the time of renewal under the scheme.",
                        style: StyleConfig.smallTextLight
                            .copyWith(color: ColorConfig.jsBlackColor, fontFamily: JSFonts.outfitBold),
                      ),
                      TextSpan(
                        text:
                            "\n\nFor subscribers enrolling for the first-time, risk starts from the date of auto-debit of premium. However, insurance cover shall not be available for death (other than due to accident) occurring during the first 30 days from the date of enrolment into the scheme (lien period) and in case of death (other than due to accident) during lien period, no claim would be admissible.",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                    ],
                  ),
                ),
              ),
              buildMainView(
                question: '3. How will the premium be paid?',
                answer:
                    "The premium will be deducted from the account holder’s bank / Post office account through ‘auto debit’ facility in one instalment, as per the consent given by the subscriber at the time of enrolment.",
                index: 2,
                onTap: () {
                  logic.isPMJJBYExpanded[2].value = !logic.isPMJJBYExpanded[2].value;
                },
              ),
              buildMainView(
                question: '4. Who will offer / administer the scheme?',
                answer:
                    'The scheme is offered/administered through LIC and other Life insurance companies willing to offer the product with necessary approvals on similar terms, in collaboration with participating Banks / Post office. Participating banks / Post office are free to engage any such life insurance company for implementing the scheme for their account holders / subscribers.',
                index: 3,
                onTap: () {
                  logic.isPMJJBYExpanded[3].value = !logic.isPMJJBYExpanded[3].value;
                },
              ),
              buildMainView(
                question: '5. Who will be eligible to subscribe?',
                answer:
                    'All individual (single or joint) account holders of participating banks / Post office, in the age group of 18 to 50 years are entitled to join. In case of multiple accounts held by an individual in one or different banks / Post offices, the person is eligible to join the scheme through one bank / Post office account only.',
                index: 4,
                onTap: () {
                  logic.isPMJJBYExpanded[4].value = !logic.isPMJJBYExpanded[4].value;
                },
              ),
              buildMainView(
                question: '6. What is the enrolment period and modality?',
                answer:
                    "The cover shall be for one-year period stretching from 1st June to 31st May. At the time of enrolment, subscriber has to provide consent, to join / pay by auto-debit from the designated individual bank / Post office account, until further instructions, an amount of Rs.436/- (Rupees Four Hundred Thirty-Six only) per annum, or any amount as decided from time to time, which may be intimated immediately if and when revised, towards renewal of coverage under the scheme. Delayed enrolment / renewal subsequent to this date will be possible on payment of appropriate premium as described in Q.2 above, subject to changes in terms regarding insurance coverage.",
                index: 5,
                onTap: () {
                  logic.isPMJJBYExpanded[5].value = !logic.isPMJJBYExpanded[5].value;
                },
              ),
              buildMainView(
                question:
                    '7. Can eligible individuals who fail to join the scheme in the initial year join in subsequent years?',
                answer:
                    'Yes, new eligible entrants can also join in future years on payment of premium through auto-debit. However, for such subscribers, insurance benefit shall not be available for death (due to any cause other than accident) occurring during the first 30 days from the date of enrolment into the scheme.',
                index: 6,
                onTap: () {
                  logic.isPMJJBYExpanded[6].value = !logic.isPMJJBYExpanded[6].value;
                },
              ),
              buildMainView(
                question: '8. Can individuals who leave the scheme re-join?',
                answer:
                    "Individuals who exit the scheme at any point may re-join the scheme in future years by paying the appropriate premium as described in Q.2 above. However, for such subscribers, insurance benefit shall not be available for death (due to any cause other than accident) occurring during the first 30 days from the date of enrolment into the scheme",
                index: 7,
                onTap: () {
                  logic.isPMJJBYExpanded[7].value = !logic.isPMJJBYExpanded[7].value;
                },
              ),
              buildMainView(
                question: "9. Who would be the Master policy holder for the scheme?  ",
                answer: "Participating Banks/ Post office are the Master policy holders for the scheme. ",
                index: 8,
                onTap: () {
                  logic.isPMJJBYExpanded[8].value = !logic.isPMJJBYExpanded[8].value;
                },
              ),
              buildMainView(
                question: "10. When can the assurance on life of the member terminate? ",
                answer:
                    "The assurance on the life of the member shall terminate / be restricted accordingly on any of the following events:\n\n1. On attaining age 55 years (age near birth day), subject to annual renewal up to that date (entry, however, will not be possible beyond the age of 50 years)\n\n2.Closure of account with the Bank or insufficiency of balance to keep the insurance in force.\n\n3.In case a member is covered through more than one account and premium is received by insurance company inadvertently, insurance cover will be restricted to Rs. 2 Lakh and the premium paid for duplicate insurance(s) shall be liable to be forfeited.",
                index: 9,
                onTap: () {
                  logic.isPMJJBYExpanded[9].value = !logic.isPMJJBYExpanded[9].value;
                },
              ),
              buildMainView(
                question:
                    "11. Will this cover be in addition to cover under any other insurance scheme the subscriber may be covered under?",
                answer: "Yes",
                index: 10,
                onTap: () {
                  logic.isPMJJBYExpanded[10].value = !logic.isPMJJBYExpanded[10].value;
                },
              ),
              buildMainView(
                question: "12. Can all holders of a joint bank account join the scheme through the said account?",
                answer:
                    "In case of a joint account, all holders of the said account can join the scheme provided they satisfy its eligibility criteria and pay the appropriate premium as described in reply to Q. 2 above.",
                index: 11,
                onTap: () {
                  logic.isPMJJBYExpanded[11].value = !logic.isPMJJBYExpanded[11].value;
                },
              ),
              buildMainView(
                question: "13. Are NRIs eligible for coverage under PMJJBY?",
                answer:
                    "Any NRI having an eligible bank account with a bank branch located in India is eligible for purchase of PMJJBY cover subject to fulfilment of the terms and conditions relating to the scheme. However, in case a claim arises, the claim benefit will be paid to the beneficiary/ nominee only in Indian currency.",
                index: 12,
                onTap: () {
                  logic.isPMJJBYExpanded[12].value = !logic.isPMJJBYExpanded[12].value;
                },
              ),
              buildMainView(
                question: "14. Which Bank Accounts are eligible for subscribing to PMJJBY?",
                answer:
                    "All bank account holders other than institutional account holders are eligible for subscribing to PMJJBY scheme.",
                index: 13,
                onTap: () {
                  logic.isPMJJBYExpanded[13].value = !logic.isPMJJBYExpanded[13].value;
                },
              ),
              buildMainView(
                question:
                    "15. Does the PMJJBY cover death resulting from natural calamities such as earthquake, flood and other convulsions of nature? What about coverage from suicide / murder?",
                answer: "All these events are covered as PMJJBY covers death due to any reason.",
                index: 14,
                onTap: () {
                  logic.isPMJJBYExpanded[14].value = !logic.isPMJJBYExpanded[14].value;
                },
              ),
              buildMainView(
                question:
                    "16. Are PMJJBY policies being introduced and serviced in association with foreign insurance Companies?",
                answer:
                    "There are no foreign insurance Companies directly operating in India. As permitted by the Insurance Act and IRDAI regulations there are some foreign Companies in joint ventures with Indian companies, where the stake of foreign insurers is restricted to 74% only.",
                index: 15,
                onTap: () {
                  logic.isPMJJBYExpanded[15].value = !logic.isPMJJBYExpanded[15].value;
                },
              ),
              buildMainView(
                question:
                    "17. Contrary to other life insurance products, benefit under PMJJBY is payable only to nominee of the insured on the death of the insured. Why is there no maturity benefit or surrender value, which is available in normal life insurance policies?",
                answer:
                    "The cover under PMJJBY is for death only and hence benefit will accrue only to nominee. PMJJBY is a pure term insurance policy, which covers only mortality with no investment component. The pricing is also accordingly low when compared to other life insurance policies where maturity benefits, surrender value etc. are available. It has been designed to provide life insurance cover to the weaker sections of the society. With this aim, the premium is kept low, eliminating the investment component.",
                index: 16,
                onTap: () {
                  logic.isPMJJBYExpanded[16].value = !logic.isPMJJBYExpanded[16].value;
                },
              ),
              buildMainView(
                question:
                    "18. Will the PMJJBY scheme which is being promoted aggressively and sold in large numbers accrue huge profits to the foreign insurance Companies who in joint venture with Indian entities have floated life insurance companies and are operating this insurance cover?",
                answer:
                    "Only Indian Insurance Companies as defined in the Insurance Act can operate in India. The policy holders’ funds of all such insurance companies operating in India including those with foreign partners within the 74% cap is to be invested in India as per regulations and cannot be invested abroad. The premium charged for PMJJBY has been worked out based on actuarial calculations considering all risk factors, current mortality rates and adverse selection. Thus, there is no scope for any huge profits accruing from the scheme.",
                index: 17,
                onTap: () {
                  logic.isPMJJBYExpanded[17].value = !logic.isPMJJBYExpanded[17].value;
                },
              ),
              buildMainView(
                question:
                    "19. In case of non-settlement of claims is it possible to proceed legally against the foreign insurers in India?",
                answer:
                    "There are no foreign insurance Companies directly operating in India. As permitted by the regulations there are Companies operating as joint ventures with Indian companies, where the stake of foreign insurers is restricted to 74% only. By definition, these are Indian insurance companies. All these companies are subject to Indian laws and there is no bar against proceeding legally against them.",
                index: 18,
                onTap: () {
                  logic.isPMJJBYExpanded[18].value = !logic.isPMJJBYExpanded[18].value;
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
      return logic.isPMJJBYExpanded[index].value
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
