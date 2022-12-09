import 'package:flutter/material.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/attendance/page/attendance_screen.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/exams/page/exams_screen.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/parent/page/parent_screen.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/student/page/student_screen.dart';

import 'core/constant/route_constant.dart';
import 'features/presentation/dashboard/page/dashboard_screen.dart';
import 'features/presentation/settings/page/settings_screen.dart';
import 'features/presentation/teacher/page/teacher_screen.dart';

/// [NamedRouter] class helps us to handle routes and animation
/// between different routes
/// we can also pass [arguments] between screens using [RouteSettings]

class NamedRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.dashBoard:
        return getPageRoute(const DashBoardScreen());
      case RouteList.teacher:
        return getPageRoute(const TeacherScreen());
      case RouteList.student:
        return getPageRoute(const StudentScreen());
      case RouteList.parent:
        return getPageRoute(const ParentScreen());
      case RouteList.attendance:
        return getPageRoute(const AttendanceScreen());
      case RouteList.exams:
        return getPageRoute(const ExamsScreen());
      case RouteList.settings:
        return getPageRoute(const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());
    }
  }
}

/// Refactor code, because it is common method
PageRouteBuilder getPageRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return screen;
    },
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return Align(
        /// you can also change it
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500), /// you can change it
  );
}