import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jan_suraksha/config/style_config.dart';

import '../../../../config/color_config.dart';
import '../../homepage/dashboard/dashboard_view.dart';

class ResponseViewPage extends StatelessWidget {
  String image;

  List<dynamic> action;
  List<String> options;

  String subTitle;

  String titleMessege;

  String title;
  ResponseViewPage({
    required this.image,
    required this.title,
    required this.titleMessege,
    required this.subTitle,
    required this.options,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_sharp,
            color: ColorConfig.jsLightBlackColor,
            size: 25.r,
          ),
        ),
        body: Container(
          color: ColorConfig.jsCreamColor,
          child: ConstrainedFlexView(
            MediaQuery.of(context).size.height * 0.75,
            axis: Axis.vertical,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 300.h, child: SvgPicture.asset(image)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title.isNotEmpty
                            ? Text(
                                title,
                                style: StyleConfig.boldLargeText.copyWith(
                                    color: ColorConfig.jsPrimaryColor),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleMessege.isNotEmpty
                            ? Text(
                                titleMessege,
                                style: StyleConfig.smallTextLight.copyWith(
                                    color: ColorConfig.jsTextGreyColor),
                                textAlign: TextAlign.center,
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        subTitle.isNotEmpty
                            ? Text(
                                subTitle,
                                style: StyleConfig.smallTextLight.copyWith(
                                    color: ColorConfig.jsTextGreyColor),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    options.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    action[0]();
                                  },
                                  child: Text(
                                    options.first,
                                    style: StyleConfig.smallTextLight.copyWith(
                                        color: ColorConfig.jsPrimaryColor),
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              options.length > 1
                                  ? GestureDetector(
                                      child: Text(options.elementAt(1),
                                          style: StyleConfig.smallTextLight
                                              .copyWith(
                                                  color: ColorConfig
                                                      .jsTextGreyColor)))
                                  : Container()
                            ],
                          )
                        : Container()
                  ],
                )),
          ),
        ));
  }
}
