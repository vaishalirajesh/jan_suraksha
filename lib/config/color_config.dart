import 'package:flutter/material.dart';

class ColorConfig {
  static final jsPrimaryColor = HexColor('#F7BC38');
  static final jsSecondaryColor = HexColor('#24699E');
  static final jsPrimaryDisableColor = HexColor('#FFF8E8');
  static final jsGreyDisableColor = HexColor('#E8E8E8');
  static final jsWhiteColor = HexColor('#FFFFFF');
  static final jsLightBlackColor = HexColor('#212121');
  static final jsBlackColor = HexColor('#000000');
  static final jsCreamColor = HexColor('#FFF7F1');
  static final jsDarkCreamColor = HexColor('#f8ede2');
  static final jsDarkPinkColor = HexColor('#8C6B6B');
  static final jsLightGreyColor = HexColor('#D9DEEA');
  static final jsRedColor = HexColor('#E65039');
  static final jsCardBgColor = HexColor('#FDFBF9');
  static final jsTextFiledBgColor = HexColor('#F1F4FA');
  static final jsGreenColor = HexColor('#00A669');
  static final jsGreyColor = HexColor('#C5C5C5');
  static final jsLightCremeColor = HexColor('#FFF2DF');
  static final jsBlueColor = HexColor('#23699E');
  static final jsHyperlinkBlueColor = HexColor('#0000FF');
  static final jsTextGreyColor = HexColor("#454F5E");
  static final jsTextDarkGreyColor = HexColor("#939393");
  static final jsTextMediumGreyColor = HexColor("#666E7A");
  static final jsCardBgBlueColor = HexColor("#D9EEFF");
  static final jsCardBgborderColor = HexColor("#EAF6FF");
  static final jstextLightGreyColor = HexColor("#666E7A");
  static final jsTextBlueGreyColor = HexColor("#7A86A1");
  static final jsSearchTextGreyColor = HexColor("#777777");
  static final jsOptOutTextGreyColor = HexColor("#9A9A9A");
  static final jsLightGreenColor = HexColor("#34A853");
  static final jsDividerGreyColor = HexColor("#B9C4CB");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
