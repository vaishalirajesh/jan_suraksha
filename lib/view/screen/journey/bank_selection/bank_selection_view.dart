import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/theme_helper.dart';
import '../../homepage/dashboard/dashboard_view.dart';
import 'bank_selection_logic.dart';

class BankSelectionPage extends StatelessWidget {
  BankSelectionPage({Key? key}) : super(key: key);
  final logic = Get.find<Bank_selectionLogic>();
  final list = [
    Assets.bankselectionSbi,
    Assets.bankselectionBoi,
    Assets.bankselectionCanara,
    Assets.bankselectionPnb,
    Assets.bankselectionBob,
    Assets.bankselectionHdfc
  ];
  final listname = [
    "State bank of India",
    "Bank of Baroda",
    "Canara bank",
    "Punjab National Bank",
    "Bank of Baroda",
    "HDFC bank"
  ];
  final banklist = {
    "AXIS BANK": "AXIS",
    "BANK OF INDIA": "BOI",
    "YES BANK": "YESBANK",
    "HSBC BANK OMAN SAOG": "HSBC",
    "CENTRAL BANK OF INDIA": "CENTRALBANK",
    "IDFC BANK LIMITED": "IDFC",
    "CITI BANK": "CITIBANK",
    "CITY UNION BANK LIMITED": "CUB",
    "CORPORATION BANK": "CORPBANK",
    "DENA BANK": "DENABANK",
    "DEUSTCHE BANK": "DB",
    "DCB BANK LIMITED": "DCB",
    "DHANALAKSHMI BANK": "DHANBANK",
    "DOMBIVLI NAGARI SAHAKARI BANK LIMITED": "DNSBANK",
    "FIRSTRAND BANK LIMITED": "FIRSTRAND",
    "HDFC BANK": "HDFC",
    "HSBC BANK": "HSBC",
    "ICICI BANK LIMITED": "ICICI",
    "IDBI BANK": "IDBI",
    "INDIAN BANK": "INDIANBANK",
    "INDIAN OVERSEAS BANK": "IOB",
    "INDUSIND BANK": "INDUSIND",
    "JANASEVA SAHAKARI BANK LIMITED": "JANASEVABANK",
    "KAPOL COOPERATIVE BANK LIMITED": "KAPOLBANK",
    "KARNATAKA BANK LIMITED": "KARNATAKABANK",
    "KARUR VYSYA BANK": "KVB",
    "KOTAK MAHINDRA BANK LIMITED": "KOTAK",
    "MAHANAGAR COOPERATIVE BANK": "MAHANAGARBANK",
    "MAHARASHTRA STATE COOPERATIVE BANK": "MSCBANK",
    "MASHREQBANK PSC": "MASHREQBANK",
    "MIZUHO BANK LTD": "MIZUHOBANK",
    "NEW INDIA COOPERATIVE BANK LIMITED": "NEWINDIABANK",
    "NKGSB COOPERATIVE BANK LIMITED": "NKGSB",
    "NUTAN NAGARIK SAHAKARI BANK LIMITED": "NUTANBANK",
    "ORIENTAL BANK OF COMMERCE": "OBC",
    "PARSIK BANK": "GPPARSIKBANK",
    "PUNJAB AND MAHARSHTRA COOPERATIVE BANK": "PMC",
    "PUNJAB AND SIND BANK": "PSB",
    "PUNJAB NATIONAL BANK": "PNB",
    "RAJKOT NAGRIK SAHAKARI BANK LIMITED": "RNSB",
    "RESERVE BANK OF INDIA": "RBI",
    "SHINHAN BANK": "SHINHAN",
    "SOCIETE GENERALE": "SOCIETEGENERALE",
    "SOUTH INDIAN BANK": "SOUTHINDIANBANK",
    "STANDARD CHARTERED BANK": "SC",
    "STATE BANK OF BIKANER AND JAIPUR": "SBBJ",
    "STATE BANK OF HYDERABAD": "SBHYD",
    "STATE BANK OF INDIA": "SBI",
    "STATE BANK OF MAURITIUS LIMITED": "SBMGROUP",
    "STATE BANK OF MYSORE": "SBM",
    "STATE BANK OF PATIALA": "SBP",
    "STATE BANK OF TRAVANCORE": "SBT",
    "SYNDICATE BANK": "SYNDICATEBANK",
    "TAMILNAD MERCANTILE BANK LIMITED": "TMBL",
    "THE BANK OF NOVA SCOTIA": "SCOTIABANK",
    "AHMEDABAD MERCANTILE COOPERATIVE BANK": "AMCOBANK",
    "BHARAT COOPERATIVE BANK MUMBAI LIMITED": "BHARATBANK",
    "FEDERAL BANK": "FEDERALBANK",
    "THE GREATER BOMBAY COOPERATIVE BANK LIMITED": "GREATERBANK",
    "JAMMU AND KASHMIR BANK LIMITED": "JKBANK",
    "KALUPUR COMMERCIAL COOPERATIVE BANK": "KALUPURBANK",
    "THE KARANATAKA STATE COOPERATIVE APEX BANK LIMITED": "KARNATAKAAPEX",
    "KALYAN JANATA SAHAKARI BANK": "KALYANJANATA",
    "LAXMI VILAS BANK": "LVB",
    "THE MEHSANA URBAN COOPERATIVE BANK": "MUCBANK",
    "THE NAINITAL BANK LIMITED": "NAINITALBANK",
    "RBL BANK LIMITED": "RBL",
    "THE ROYAL BANK OF SCOTLAND": "RBS",
    "SARASWAT COOPERATIVE BANK LIMITED": "SARASWATBANK",
    "THE SHAMRAO VITHAL COOPERATIVE BANK": "SVCBANK",
    "THE SURATH PEOPLES COOPERATIVE BANK LIMITED": "SPCBL",
    "THE TAMIL NADU STATE APEX COOPERATIVE BANK": "TNSCBANK",
    "THE WEST BENGAL STATE COOPERATIVE BANK": "WBSCB",
    "UCO BANK": "UCOBANK",
    "UNION BANK OF INDIA": "UNIONBANK",
    "UNITED BANK OF INDIA": "UNITEDBANK",
    "VIJAYA BANK": "VIJAYABANK",
    "BANK OF BARODA": "BOB"
  };

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "Select Bank",
        buttonTitle: "",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        child: ConstrainedFlexView(MediaQuery.of(context).size.height * 1,
            axis: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 10.h, right: 10.h),
                    child: SizedBox(
                      height: 40.h,
                      width: 240.w,
                      child: TextField(
                        autofocus: false,
                        style: StyleConfig.regularText16,
                        onChanged: (_) {},
                        cursorColor: ColorConfig.jsPrimaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                          prefixIcon: Icon(Icons.search_rounded,
                              color: ThemeHelper.getInstance()!.primaryColor),
                          labelText: "Search",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintStyle: TextStyle(
                              color: ThemeHelper.getInstance()!.primaryColor),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: ThemeHelper.getInstance()!.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 200.h,
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      children: List.generate(
                        6,
                        (index) => InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 150.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 30.r,
                                    width: 30.r,
                                    child: Image.asset(list[index])),
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      listname[index],
                                      textAlign: TextAlign.center,
                                      style: StyleConfig.boldText16.copyWith(
                                          color: Colors.black, fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      "All Banks",
                      style: StyleConfig.boldText16
                          .copyWith(color: Colors.black, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 300.h,
                    child: ListView.separated(
                      itemCount: 7,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(height: 1),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ListTile(
                            title: Text(
                              '${banklist.keys.elementAt(index).toLowerCase().capitalize}',
                              style: StyleConfig.mediumText16
                                  .copyWith(fontSize: 13.sp),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ])));
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
