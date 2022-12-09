import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_school_management_admin_panel/core/constant/route_constant.dart';
import '../constant/app_colors.dart';
import '../constant/app_text.dart';
import '../constant/app_text_style.dart';


/// This [SideBarWidget] is a common widget, through which
/// we can control left admin menu items.
/// Here we can add multiple items of [AdminMenuItem]
/// of type [AdminMenuItem]
/// e.g [Users] and its [childs]

class SideBarWidget {

  /// List of [AdminMenuItem]
  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: AppText.dashBoardText,
      route: RouteList.dashBoard,
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: AppText.userText,
      icon: Icons.person,
      children: [
        AdminMenuItem(
          title: AppText.teacherText,
          route: RouteList.teacher,
        ),
        AdminMenuItem(
          title: AppText.studentText,
          route: RouteList.student,
        ),
        AdminMenuItem(
          title: AppText.parentText,
          route: RouteList.parent,
        ),
      ],
    ),
    AdminMenuItem(
      title: AppText.attendance,
      route: RouteList.attendance,
      icon: Icons.calendar_month_outlined,
    ),
    AdminMenuItem(
      title: AppText.exams,
      route: RouteList.exams,
      icon: Icons.insert_page_break_outlined,
    ),
    AdminMenuItem(
      title: AppText.settings,
      route: RouteList.settings,
      icon: Icons.settings,
    ),
  ];

  /// Represents Side Menu
  sideBarMenus(context, selectedRoute) {
    return SideBar(
      backgroundColor: AppColors.white,
      activeBackgroundColor: AppColors.black.withOpacity(0.3),
      borderColor: AppColors.white,
      iconColor: AppColors.black,
      activeIconColor: AppColors.primary,
      textStyle: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
      activeTextStyle: AppTextStyles.bodySm.copyWith(color: AppColors.white),
      items: _sideBarItems,
      selectedRoute: selectedRoute,
      onSelected: (item) {

        /// Help us to navigate between different screens.
        if (item.route != null) {
          Navigator.of(context).pushReplacementNamed(item.route!);
        }
      },
    );
  }
}


