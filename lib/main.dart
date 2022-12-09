import 'package:flutter/material.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/dashboard/page/dashboard_screen.dart';
import 'package:flutter_school_management_admin_panel/routes.dart';

import 'core/constant/app_themes.dart';
import 'core/constant/route_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'School Management Web Panel',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        //routes:  RouteList.getAllRoutes(),
        onGenerateRoute: NamedRouter.generateRoute,
        initialRoute: RouteList.dashBoard,
        home: const DashBoardScreen(),
    );
  }
}
