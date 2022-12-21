import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/dashboard/page/dashboard_screen.dart';
import 'package:flutter_school_management_admin_panel/routes.dart';

import 'core/constant/app_themes.dart';
import 'core/constant/route_constant.dart';
import 'features/presentation/teacher/bloc/teacher_cubit.dart';
import 'core/injector/injector_config.dart' as di;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD5nRoBhVUYSpHsuIehFTUKzU0IOoHckpw",
        appId:  "1:844229422024:web:72de920e429b2c16eeeefd",
        messagingSenderId: "844229422024",
        projectId: "schoolmanagementsystem-43845",
        storageBucket: "schoolmanagementsystem-43845.appspot.com")
  );
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TeacherCubit>(
          create: (context) => di.sl<TeacherCubit>()),
      ],
      child: const MyApp(),
    ),
  );
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
