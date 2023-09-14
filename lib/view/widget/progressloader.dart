import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';

class LoaderUtils {
  static final LoaderUtils _instance = LoaderUtils.internal();

  LoaderUtils.internal();

  factory LoaderUtils() => _instance;

  static Future<void> showLoaderwithmsg(BuildContext context, {required String msg}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              showSnackBar(context, "str_back_press_alert_msg");
              return false;
            },
            child: Scaffold(
              backgroundColor: ColorConfig.jsBlackColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: ColorConfig.jsPrimaryColor,
                            strokeWidth: 4.w,
                            color: ColorConfig.jsSecondaryColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Center(
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          style: StyleConfig.boldMediumText?.copyWith(
                            color: ColorConfig.jsBlackColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showOfferExpired(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (BuildContext context) => DashboardWithGST()),
              //   (route) => false, //if you want to disable back feature set to false
              // );

              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_outlined,
                        color: ColorConfig.jsPrimaryColor,
                        size: 50.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Sorry!",
                        style: StyleConfig.boldMediumText,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'It seems this offer is expired. Request you to start new loan process once new GST return is filled.',
                        style: StyleConfig.boldMediumText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "str_back_home",
                              style: StyleConfig.boldMediumText,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void showOfferIneligible(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_outlined,
                        color: ColorConfig.jsPrimaryColor,
                        size: 50.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Sorry!",
                        style: StyleConfig.boldMediumText,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Lender has not reverted with offer for your shared GST invoices. Request you to start new loan process once new GST return is filed',
                        style: StyleConfig.boldMediumText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "str_back_home",
                              style: StyleConfig.boldMediumText,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void showBureauFail(BuildContext context, String? message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_outlined,
                        color: ColorConfig.jsPrimaryColor,
                        size: 50.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Sorry!",
                        style: StyleConfig.boldMediumText,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        message ?? '',
                        style: StyleConfig.boldMediumText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "str_back_home",
                              style: StyleConfig.boldMediumText,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<void> handleErrorResponse(
      BuildContext context, int? status, String? message, String? stageStatus) async {
    if (status == RES_OFFER_EXPIRED) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => const OfferExpireDialog(),
      //     ),
      //     (route) => false);
    } else if (status == RES_OFFER_INELIGIBLE) {
      showOfferIneligible(context);
    } else if (status == ACTION_REQUIRED) {
      showBureauFail(context, message);
    } else if (stageStatus != null && stageStatus == "ACTION_REQUIRED") {
      showBureauFail(context, message);
    } else if (status == RES_UNAUTHORISED) {
      await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
      SystemNavigator.pop(animated: true);
    } else {
      showSnackBar(context, message ?? "");
    }
  }
}

//showDialog(context: context, builder: (BuildContext context) => errorDialog);}
