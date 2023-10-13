import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/utils.dart';
import '../../../widget/app_common_screen.dart';
import 'genral_faq_logic.dart';

class GeneralFaqPage extends StatelessWidget {
  GeneralFaqPage({Key? key}) : super(key: key);

  final logic = Get.find<GeneralFaqLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "General FAQs",
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
                question: '1. What is Jansuraksha Portal ?',
                answer:
                    'Jansuraksha is a Digital platform envisaged by the Department of Financial Services, Ministry of Finance to provide access to Social Security Insurance Schemes at affordable rates, introduced by the Government of India. Banks and insurance companies have partnered on the Jansuraksha portal to provide a digital journey for the subscribers for enrollments, issuance of policy certificates and claims processing.\n\nThe portal has been jointly created and is being maintained by the General insurance Council, the Life Insurance Council and the Indian Banks Association.',
                index: 0,
                onTap: () {
                  logic.isExpanded[0].value = !logic.isExpanded[0].value;
                },
              ),
              buildMainView(
                question: '2. What are the schemes available?',
                answer:
                    'Currently there are two schemes, PMSBY and PMJJBY each having different eligibility criteria. For more details, please refer to the scheme details at https://jansuraksha.gov.in',
                index: 1,
                onTap: () {
                  logic.isExpanded[1].value = !logic.isExpanded[1].value;
                },
                widget: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Currently there are two schemes, PMSBY and PMJJBY each having different eligibility criteria. For more details, please refer to the scheme details at ',
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: "https://jansuraksha.gov.in",
                        style: StyleConfig.smallTextLight
                            .copyWith(color: ColorConfig.jsHyperlinkBlueColor, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.gov.in"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                      TextSpan(
                        text: " and the FAQs.",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                    ],
                  ),
                ),
              ),
              buildMainView(
                question: '3. How can I apply to the schemes?',
                answer:
                    'The schemes are linked closely to KYC verified bank accounts. There are two methods of enrollment into the schemes. \n\nFor a customer direct journey, Once an individual inputs the basic details of the bank account, the requisite data is automatically fetched from the Banks through secure integration. All basic documentation needs to be updated at the bank.\n\nIn case of a bank assisted journey, the customer has to submit a duly filled in consent -cum-declaration form for enrollments to his bank/post office branch along with the required documents. You may access the form here',
                index: 2,
                onTap: () {
                  logic.isExpanded[2].value = !logic.isExpanded[2].value;
                },
                widget: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'The schemes are linked closely to KYC verified bank accounts. There are two methods of enrollment into the schemes. \n\nFor a customer direct journey, Once an individual inputs the basic details of the bank account, the requisite data is automatically fetched from the Banks through secure integration. All basic documentation needs to be updated at the bank.\n\nIn case of a bank assisted journey, the customer has to submit a duly filled in consent -cum-declaration form for enrollments to his bank/post office branch along with the required documents. You may access the form here',
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: " PMJJBY Application Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ApplicationForm_PMJJBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                      TextSpan(
                        text: " & ",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: "PMSBY Application Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ApplicationForm_PMSBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              buildMainView(
                question: '4. What are the documents required?',
                answer:
                    'There is a enrollment form and some proof that are required. The details of the same can be found on the link',
                index: 3,
                onTap: () {
                  logic.isExpanded[3].value = !logic.isExpanded[3].value;
                },
                widget: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'There is a enrollment form and some proof that are required. The details of the same can be found on the link',
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: " PMJJBY Application Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ApplicationForm_PMJJBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                      TextSpan(
                        text: " & ",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: "PMSBY Application Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ApplicationForm_PMSBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              buildMainView(
                question: '5. Who can apply for the scheme?',
                answer:
                    'All bank/post office account holders other than institutional account holders can subscribe to the scheme subject to eligibility.',
                index: 4,
                onTap: () {
                  logic.isExpanded[4].value = !logic.isExpanded[4].value;
                },
              ),
              buildMainView(
                question: '6. How can a claim be filed?',
                answer:
                    'In case of a claim, the claimant has to submit the duly filled in and signed claim form along with relevant documents to the bank /post office branch in which the subscriber was enrolled and the premium was debited. The claim form can be accessed here',
                index: 5,
                onTap: () {
                  logic.isExpanded[5].value = !logic.isExpanded[5].value;
                },
                widget: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'In case of a claim, the claimant has to submit the duly filled in and signed claim form along with relevant documents to the bank /post office branch in which the subscriber was enrolled and the premium was debited. The claim form can be accessed here',
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: " PMJJBY Claim Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ClaimForm_PMJJBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                      TextSpan(
                        text: " & ",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                      ),
                      TextSpan(
                        text: "PMSBY Claim Form",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsHyperlinkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse("https://jansuraksha.in/assets/PDF/ClaimForm_PMSBY.pdf"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              buildMainView(
                question: '7. Who will settle the claim?',
                answer: 'Claims will be settled by the Insurer linked/tied up with the partner Bank. ',
                index: 6,
                onTap: () {
                  logic.isExpanded[6].value = !logic.isExpanded[6].value;
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
          children: [
            Row(
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
      return logic.isExpanded[index].value
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
