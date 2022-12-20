import 'package:entrance_prep/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        // minTextAdapt: true,
        // splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Entrance Prep',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: 'Poppins',
                textTheme: TextTheme(
                    titleLarge: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    titleSmall: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    bodyMedium: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    displayMedium: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                    bodySmall: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0.sp,
                      color: Colors.grey,
                    ))),
            home: BaseScreen(),
          );
        });
  }
}
