import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_cast/models/tabButtonModel.dart';
import 'package:sales_cast/utils/pathLib.dart';
import 'package:sales_cast/utils/stringLib.dart';

class ModelListLib {
  static final List<TabButtonModel> appTabs = [
    TabButtonModel(
      lable: StringLib.dashboardTxt,
      iconImg: SvgPicture.asset(PathLib.svgHome),
    ),
    TabButtonModel(
      lable: StringLib.filtersTxt,
      iconImg: SvgPicture.asset(PathLib.svgFolder),
    ),
    TabButtonModel(
      lable: StringLib.notificationTxt,
      iconImg: SvgPicture.asset(PathLib.svgNotification),
    ),
    TabButtonModel(
      lable: StringLib.aboutUsTxt,
      iconImg: SvgPicture.asset(PathLib.svgAboutUs),
    ),
  ];

  static final List<TabButtonModel> systemTabs = [
    TabButtonModel(
      lable: StringLib.apperanceTxt,
      iconImg: SvgPicture.asset(PathLib.svgAppearance),
    ),
    TabButtonModel(
      lable: StringLib.settingTxt,
      iconImg: SvgPicture.asset(PathLib.svgSettings),
    ),
  ];
}
