import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';
import 'package:jan_suraksha/utils/utils.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    Key? key,
    required this.isSelected,
    required this.index,
    required this.userName,
    required this.onChnage,
  }) : super(key: key);
  final RxBool isSelected;
  final int index;
  final String userName;
  final VoidCallback onChnage;

  @override
  Widget build(BuildContext context) {
    TGLog.d("Selected value--${isSelected.value}--index--$index");
    return Container();
  }
}
