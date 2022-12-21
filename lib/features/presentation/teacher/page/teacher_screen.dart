import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/app_text_style.dart';
import '../../../../core/constant/route_constant.dart';
import '../../../../core/widgets/side_bar_widget.dart';
import '../widget/right_teacher_sheet.dart';

/// Here [admin] can add/update
/// information of teachers.

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AdminScaffold(
      backgroundColor: AppColors.secondary.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          AppText.schoolManagement,
          style: AppTextStyles.h3.copyWith(color: AppColors.white),
        ),
      ),
      sideBar: SideBarWidget().sideBarMenus(context, RouteList.teacher),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0,0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppText.teacherText, style: AppTextStyles.h2),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () => SideSheet.right(context: context, width: size.width * 0.3,
                          body: RightTeacherSheet(size: size),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.add),
                              Text(AppText.addTeacher),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
