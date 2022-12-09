import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_colors.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_text_style.dart';
import 'package:flutter_school_management_admin_panel/core/constant/route_constant.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/widgets/side_bar_widget.dart';

/// [DashBoardScreen] represents total number
/// of students, teachers and parents.
/// Upcoming events and fee related graphs.

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// flutter_admin_scaffold
    return AdminScaffold(
      backgroundColor: AppColors.secondary.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          AppText.schoolManagement,
          style: AppTextStyles.h3.copyWith(color: AppColors.white),
        ),
      ),
      sideBar: SideBarWidget().sideBarMenus(context, RouteList.dashBoard),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
